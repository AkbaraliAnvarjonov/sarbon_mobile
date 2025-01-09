import 'package:equatable/equatable.dart';

import '../../../data/models/opposite_offer/fetch_currency_response.dart';

class FetchCurrencyEntity extends Equatable {
  const FetchCurrencyEntity({
    required this.currency,
  });

  final List<CurrencyItemEntity> currency;

  @override
  List<Object?> get props => [currency];
}

class CurrencyItemEntity {
  String? guid;
  String? code;

  CurrencyItemEntity({
    this.guid,
    this.code,
  });
}

extension FetchCurrencyEntityX on FetchCurrencyResponse {
  FetchCurrencyEntity toEntity() => FetchCurrencyEntity(
        currency: data?.data?.response
                ?.map(
                  (currency) => CurrencyItemEntity(
                    guid: currency.guid ?? '',
                    code: currency.code ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
