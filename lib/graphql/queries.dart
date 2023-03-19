class QueryRepository {
  static String get getUserProfile => '''
    query{
      userProfile{
        firstName
        lastName
        email
        id
        nickName
        civilStatus
        distrito
        documentNumber
        gender
        hasCompletedOnboarding
        id
        isActive
        occupation
        provincia
        region
        typeDocument
        uuid
        imageProfileUrl
      }
    }
  ''';

  static String get regions => '''
    query{
      regions{
        coddpto
        nomDpto
        slug
      }
    }
  ''';

  static String get provinces => '''
    query{
      provincias{
        idprov
        codprov
        nomProv
        dpto{
          coddpto
        }
        slug
      }
    }
  ''';

  static String get districts => '''
    query{
      distritos{
        prov{
          codprov
        }
        iddist
        coddist
        nomDist
        slug
      }
    }
  ''';
}
