//
//  NetworkService.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

final class NetworkService {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func request(with config: NetworkConfig) async throws {
        let (_, response) = try await makeRequest(config: config)
        try handleResponse(response)
    }

    func request<Model: Decodable>(
        with config: NetworkConfig
    ) async throws -> Model {
        let (data, response) = try await makeRequest(config: config)

        try handleResponse(response)

        guard let model = try? decoder.decode(Model.self, from: data) else {
            throw NetworkError.decodingError
        }

        return model
    }

    func encode(_ value: some Encodable) throws -> Data {
        guard let encoded = try? encoder.encode(value) else {
            throw NetworkError.encodingError
        }

        return encoded
    }
}

private extension NetworkService {
    func makeRequest(config: NetworkConfig) async throws -> (Data, URLResponse) {
        let urlRequest = try buildRequest(with: config)
        return try await URLSession.shared.data(for: urlRequest)
    }

    func buildRequest(with config: NetworkConfig) throws -> URLRequest {
        let urlString = config.baseUrl + config.path + config.endPoint
        guard let url = URL(string: urlString) else { throw NetworkError.missingURL }

        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)

        switch config.task {
        case let .requestBody(data):
            request.httpBody = data

        case let .requestUrlParameters(parameters):
            try URLParameterEncoder().encode(urlRequest: &request, with: parameters)

        default: break
        }

        request.httpMethod = config.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }

    func handleResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else { return }

        guard
            (200 ... 299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }
    }
}
