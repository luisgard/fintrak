import 'package:dio/dio.dart';
import '../models/transaction.dart';
import '../../core/constants/api_constants.dart';

class TransactionRepository {
  final Dio _dio = Dio();

  Future<List<Transaction>> getAll() async {
    try {
      final response = await _dio.get(ApiConstants.transactions);
      final List data = response.data;
      return data.map((json) => Transaction.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error fetching transactions: $e');
    }
  }

  Future<Transaction> create(Transaction transaction) async {
    try {
      final response = await _dio.post(
        ApiConstants.transactions,
        data: transaction.toJson(),
      );
      return Transaction.fromJson(response.data);
    } catch (e) {
      throw Exception('Error creating transaction: $e');
    }
  }

  Future<Transaction> update(String id, Transaction transaction) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.transactions}/$id',
        data: transaction.toJson(),
      );
      return Transaction.fromJson(response.data);
    } catch (e) {
      throw Exception('Error updating transaction: $e');
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete('${ApiConstants.transactions}/$id');
    } catch (e) {
      throw Exception('Error deleting transaction: $e');
    }
  }
}
