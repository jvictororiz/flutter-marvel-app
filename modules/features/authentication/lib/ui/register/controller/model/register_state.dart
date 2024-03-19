class RegisterState {
  bool isLoading;


  RegisterState({
    this.isLoading = false,
  });

  RegisterState copyWith({
    bool? isLoading,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}