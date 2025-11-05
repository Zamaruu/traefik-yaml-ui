/// Interface for all Enums which need to be identified by a unique, pre-given Id rather than index or name attributes.
abstract interface class IIdentifiableEnum<E extends IIdentifiableEnum<E>> {
  int get id;
}
