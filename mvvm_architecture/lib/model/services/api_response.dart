enum Status {loading, complete, error}
//Enum = fixed set of values.

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading(): status = Status.loading;
  ApiResponse.complete(this.data): status = Status.complete;
  ApiResponse.error(this.message): status = Status.error;

  @override
  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}

// This file creates a wrapper class around your API data.
// It helps your UI know:
// Is data loading?
// Is data received?
// Is there an error?
// Without this class, your UI would be messy.