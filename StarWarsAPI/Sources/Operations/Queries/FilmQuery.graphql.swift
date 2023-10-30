// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FilmQuery: GraphQLQuery {
  public static let operationName: String = "Film"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Film($filmId: ID) { film(id: $filmId) { __typename id title openingCrawl episodeID characterConnection { __typename characters { __typename id name } } } }"#
    ))

  public var filmId: GraphQLNullable<ID>

  public init(filmId: GraphQLNullable<ID>) {
    self.filmId = filmId
  }

  public var __variables: Variables? { ["filmId": filmId] }

  public struct Data: StarWarsAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { StarWarsAPI.Objects.Root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("film", Film?.self, arguments: ["id": .variable("filmId")]),
    ] }

    public var film: Film? { __data["film"] }

    /// Film
    ///
    /// Parent Type: `Film`
    public struct Film: StarWarsAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { StarWarsAPI.Objects.Film }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", StarWarsAPI.ID.self),
        .field("title", String?.self),
        .field("openingCrawl", String?.self),
        .field("episodeID", Int?.self),
        .field("characterConnection", CharacterConnection?.self),
      ] }

      /// The ID of an object
      public var id: StarWarsAPI.ID { __data["id"] }
      /// The title of this film.
      public var title: String? { __data["title"] }
      /// The opening paragraphs at the beginning of this film.
      public var openingCrawl: String? { __data["openingCrawl"] }
      /// The episode number of this film.
      public var episodeID: Int? { __data["episodeID"] }
      public var characterConnection: CharacterConnection? { __data["characterConnection"] }

      /// Film.CharacterConnection
      ///
      /// Parent Type: `FilmCharactersConnection`
      public struct CharacterConnection: StarWarsAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { StarWarsAPI.Objects.FilmCharactersConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("characters", [Character?]?.self),
        ] }

        /// A list of all of the objects returned in the connection. This is a convenience
        /// field provided for quickly exploring the API; rather than querying for
        /// "{ edges { node } }" when no edge data is needed, this field can be be used
        /// instead. Note that when clients like Relay need to fetch the "cursor" field on
        /// the edge to enable efficient pagination, this shortcut cannot be used, and the
        /// full "{ edges { node } }" version should be used instead.
        public var characters: [Character?]? { __data["characters"] }

        /// Film.CharacterConnection.Character
        ///
        /// Parent Type: `Person`
        public struct Character: StarWarsAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { StarWarsAPI.Objects.Person }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", StarWarsAPI.ID.self),
            .field("name", String?.self),
          ] }

          /// The ID of an object
          public var id: StarWarsAPI.ID { __data["id"] }
          /// The name of this person.
          public var name: String? { __data["name"] }
        }
      }
    }
  }
}
