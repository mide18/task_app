

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/api/exceptions/exceptions.dart';
import 'package:task_manager_app/core/api/request_state.dart';

class RequestStateNotifier<T> extends StateNotifier<RequestState<T>> {
  RequestStateNotifier() : super(RequestState.idle());

  Future<RequestState<T>> makeRequest(Future<T> Function() function) async {
    try {
      state = RequestState<T>.loading();
      final T response = await function();
      final newState = RequestState<T>.success(response);
      if (mounted) {
        state = newState;
      }

      return newState;
    } on UnAuthorisedException catch (unauthorizedError, stackTrace) {
      final errorMessage = unauthorizedError.error.data.error;
      final newState = RequestState<T>.error(
          errorMessage: "$errorMessage", stackTrace: stackTrace);
      if (mounted) {
        state = newState;
      }

      return newState;
    } on TokenMismatchException catch (e, stackTrace) {
      final errorMessage = e.toString();
      final newState = RequestState<T>.error(
          errorMessage: "$errorMessage", stackTrace: stackTrace);
      if (mounted) {
        state = newState;
      }
      return newState;
    } on Forbidden catch (forbiddenError, stackTrace) {
      final forbiddenErrorMessage = forbiddenError.error.data.error;
      final newState = RequestState<T>.error(
          errorMessage: "$forbiddenErrorMessage", stackTrace: stackTrace);
      if (mounted) {
        state = newState;
      }
      return newState;
    } on UnProcessableEntity catch (e, stackTrace) {
      final errorMessage = e.toString();
      final newState = RequestState<T>.error(
          errorMessage: "$errorMessage", stackTrace: stackTrace);
      if (mounted) {
        state = newState;
      }
      return newState;
    }catch (e, stackTrace) {
      final errorMessage = e.toString();
      final newState = RequestState<T>.error(
          errorMessage: "$errorMessage", stackTrace: stackTrace);
      if (mounted) {
        state = newState;
      }
      return newState;
    }
  }
}

//create a loginStateNotifier that extends request Notifier
