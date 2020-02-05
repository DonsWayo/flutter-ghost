// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));

String tagsToJson(Tags data) => json.encode(data.toJson());



class Tags {
    List<Tag> tags;

    Tags({
        this.tags,
    });

    factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    };
}


class Count {
    int posts;

    Count({
        this.posts,
    });

    factory Count.fromJson(Map<String, dynamic> json) => Count(
        posts: json["posts"],
    );

    Map<String, dynamic> toJson() => {
        "posts": posts,
    };
}

class Users {
    List<User> users;
    Meta meta;

    Users({
        this.users,
        this.meta,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class User {
    String id;
    String name;
    String slug;
    String email;
    String profileImage;
    dynamic coverImage;
    String bio;
    dynamic website;
    String location;
    dynamic facebook;
    dynamic twitter;
    String accessibility;
    String status;
    dynamic metaTitle;
    dynamic metaDescription;
    String tour;
    DateTime lastSeen;
    DateTime createdAt;
    DateTime updatedAt;
    String url;

    User({
        this.id,
        this.name,
        this.slug,
        this.email,
        this.profileImage,
        this.coverImage,
        this.bio,
        this.website,
        this.location,
        this.facebook,
        this.twitter,
        this.accessibility,
        this.status,
        this.metaTitle,
        this.metaDescription,
        this.tour,
        this.lastSeen,
        this.createdAt,
        this.updatedAt,
        this.url,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        email: json["email"],
        profileImage: json["profile_image"],
        coverImage: json["cover_image"],
        bio: json["bio"],
        website: json["website"],
        location: json["location"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        accessibility: json["accessibility"],
        status: json["status"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        tour: json["tour"],
        lastSeen: DateTime.parse(json["last_seen"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "email": email,
        "profile_image": profileImage,
        "cover_image": coverImage,
        "bio": bio,
        "website": website,
        "location": location,
        "facebook": facebook,
        "twitter": twitter,
        "accessibility": accessibility,
        "status": status,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "tour": tour,
        "last_seen": lastSeen.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
    };
}

class Posts {
    List<Post> posts;
    Meta meta;

    Posts({
        this.posts,
        this.meta,
    });

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        posts: json["posts"] == null ? null : List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "posts": posts == null ? null : List<dynamic>.from(posts.map((x) => x.toJson())),
        "meta": meta == null ? null : meta.toJson(),
    };
}

class Meta {
    Pagination pagination;

    Meta({
        this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination.toJson(),
    };
}

class Pagination {
    int page;
    int limit;
    int pages;
    int total;
    dynamic next;
    dynamic prev;

    Pagination({
        this.page,
        this.limit,
        this.pages,
        this.total,
        this.next,
        this.prev,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
        pages: json["pages"] == null ? null : json["pages"],
        total: json["total"] == null ? null : json["total"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
        "pages": pages == null ? null : pages,
        "total": total == null ? null : total,
        "next": next,
        "prev": prev,
    };
}

class Post {
    String id;
    String uuid;
    String title;
    String slug;
    String html;
    String commentId;
    String featureImage;
    bool featured;
    String status;
    Visibility visibility;
    bool sendEmailWhenPublished;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    String customExcerpt;
    dynamic codeinjectionHead;
    dynamic codeinjectionFoot;
    dynamic customTemplate;
    dynamic canonicalUrl;
    List<Tag> tags;
    List<Author> authors;
    Author primaryAuthor;
    Tag primaryTag;
    String url;
    String excerpt;
    int readingTime;
    dynamic email;
    dynamic ogImage;
    dynamic ogTitle;
    dynamic ogDescription;
    dynamic twitterImage;
    dynamic twitterTitle;
    dynamic twitterDescription;
    dynamic metaTitle;
    dynamic metaDescription;
    dynamic emailSubject;

    Post({
        this.id,
        this.uuid,
        this.title,
        this.slug,
        this.html,
        this.commentId,
        this.featureImage,
        this.featured,
        this.status,
        this.visibility,
        this.sendEmailWhenPublished,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.customExcerpt,
        this.codeinjectionHead,
        this.codeinjectionFoot,
        this.customTemplate,
        this.canonicalUrl,
        this.tags,
        this.authors,
        this.primaryAuthor,
        this.primaryTag,
        this.url,
        this.excerpt,
        this.readingTime,
        this.email,
        this.ogImage,
        this.ogTitle,
        this.ogDescription,
        this.twitterImage,
        this.twitterTitle,
        this.twitterDescription,
        this.metaTitle,
        this.metaDescription,
        this.emailSubject,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] == null ? null : json["id"],
        uuid: json["uuid"] == null ? null : json["uuid"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        html: json["html"] == null ? null : json["html"],
        commentId: json["comment_id"] == null ? null : json["comment_id"],
        featureImage: json["feature_image"] == null ? null : json["feature_image"],
        featured: json["featured"] == null ? null : json["featured"],
        status: json["status"] == null ? null : json["status"],
        visibility: json["visibility"] == null ? null : visibilityValues.map[json["visibility"]],
        sendEmailWhenPublished: json["send_email_when_published"] == null ? null : json["send_email_when_published"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        customExcerpt: json["custom_excerpt"] == null ? null : json["custom_excerpt"],
        codeinjectionHead: json["codeinjection_head"],
        codeinjectionFoot: json["codeinjection_foot"],
        customTemplate: json["custom_template"],
        canonicalUrl: json["canonical_url"],
        tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        authors: json["authors"] == null ? null : List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        primaryAuthor: json["primary_author"] == null ? null : Author.fromJson(json["primary_author"]),
        primaryTag: json["primary_tag"] == null ? null : Tag.fromJson(json["primary_tag"]),
        url: json["url"] == null ? null : json["url"],
        excerpt: json["excerpt"] == null ? null : json["excerpt"],
        readingTime: json["reading_time"] == null ? null : json["reading_time"],
        email: json["email"],
        ogImage: json["og_image"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        twitterImage: json["twitter_image"],
        twitterTitle: json["twitter_title"],
        twitterDescription: json["twitter_description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        emailSubject: json["email_subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "uuid": uuid == null ? null : uuid,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "html": html == null ? null : html,
        "comment_id": commentId == null ? null : commentId,
        "feature_image": featureImage == null ? null : featureImage,
        "featured": featured == null ? null : featured,
        "status": status == null ? null : status,
        "visibility": visibility == null ? null : visibilityValues.reverse[visibility],
        "send_email_when_published": sendEmailWhenPublished == null ? null : sendEmailWhenPublished,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "published_at": publishedAt == null ? null : publishedAt.toIso8601String(),
        "custom_excerpt": customExcerpt == null ? null : customExcerpt,
        "codeinjection_head": codeinjectionHead,
        "codeinjection_foot": codeinjectionFoot,
        "custom_template": customTemplate,
        "canonical_url": canonicalUrl,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x.toJson())),
        "authors": authors == null ? null : List<dynamic>.from(authors.map((x) => x.toJson())),
        "primary_author": primaryAuthor == null ? null : primaryAuthor.toJson(),
        "primary_tag": primaryTag == null ? null : primaryTag.toJson(),
        "url": url == null ? null : url,
        "excerpt": excerpt == null ? null : excerpt,
        "reading_time": readingTime == null ? null : readingTime,
        "email": email,
        "og_image": ogImage,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "twitter_image": twitterImage,
        "twitter_title": twitterTitle,
        "twitter_description": twitterDescription,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "email_subject": emailSubject,
    };
}

class Author {
    PrimaryAuthorId id;
    PrimaryAuthorName name;
    Facebook slug;
    Email email;
    String profileImage;
    dynamic coverImage;
    Bio bio;
    String website;
    Location location;
    Facebook facebook;
    Facebook twitter;
    dynamic accessibility;
    Status status;
    dynamic metaTitle;
    dynamic metaDescription;
    dynamic tour;
    dynamic lastSeen;
    DateTime createdAt;
    DateTime updatedAt;
    List<Role> roles;
    String url;

    Author({
        this.id,
        this.name,
        this.slug,
        this.email,
        this.profileImage,
        this.coverImage,
        this.bio,
        this.website,
        this.location,
        this.facebook,
        this.twitter,
        this.accessibility,
        this.status,
        this.metaTitle,
        this.metaDescription,
        this.tour,
        this.lastSeen,
        this.createdAt,
        this.updatedAt,
        this.roles,
        this.url,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"] == null ? null : primaryAuthorIdValues.map[json["id"]],
        name: json["name"] == null ? null : primaryAuthorNameValues.map[json["name"]],
        slug: json["slug"] == null ? null : facebookValues.map[json["slug"]],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
        profileImage: json["profile_image"] == null ? null : json["profile_image"],
        coverImage: json["cover_image"],
        bio: json["bio"] == null ? null : bioValues.map[json["bio"]],
        website: json["website"] == null ? null : json["website"],
        location: json["location"] == null ? null : locationValues.map[json["location"]],
        facebook: json["facebook"] == null ? null : facebookValues.map[json["facebook"]],
        twitter: json["twitter"] == null ? null : facebookValues.map[json["twitter"]],
        accessibility: json["accessibility"],
        status: json["status"] == null ? null : statusValues.map[json["status"]],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        tour: json["tour"],
        lastSeen: json["last_seen"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        roles: json["roles"] == null ? null : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : primaryAuthorIdValues.reverse[id],
        "name": name == null ? null : primaryAuthorNameValues.reverse[name],
        "slug": slug == null ? null : facebookValues.reverse[slug],
        "email": email == null ? null : emailValues.reverse[email],
        "profile_image": profileImage == null ? null : profileImage,
        "cover_image": coverImage,
        "bio": bio == null ? null : bioValues.reverse[bio],
        "website": website == null ? null : website,
        "location": location == null ? null : locationValues.reverse[location],
        "facebook": facebook == null ? null : facebookValues.reverse[facebook],
        "twitter": twitter == null ? null : facebookValues.reverse[twitter],
        "accessibility": accessibility,
        "status": status == null ? null : statusValues.reverse[status],
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "tour": tour,
        "last_seen": lastSeen,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x.toJson())),
        "url": url == null ? null : url,
    };
}

enum Bio { YOU_CAN_DELETE_THIS_USER_TO_REMOVE_ALL_THE_WELCOME_POSTS }

final bioValues = EnumValues({
    "You can delete this user to remove all the welcome posts": Bio.YOU_CAN_DELETE_THIS_USER_TO_REMOVE_ALL_THE_WELCOME_POSTS
});

enum Email { GHOST_AUTHOR_EXAMPLE_COM }

final emailValues = EnumValues({
    "ghost-author@example.com": Email.GHOST_AUTHOR_EXAMPLE_COM
});

enum Facebook { GHOST }

final facebookValues = EnumValues({
    "ghost": Facebook.GHOST
});

enum PrimaryAuthorId { THE_5951_F5_FCA366002_EBD5_DBEF7 }

final primaryAuthorIdValues = EnumValues({
    "5951f5fca366002ebd5dbef7": PrimaryAuthorId.THE_5951_F5_FCA366002_EBD5_DBEF7
});

enum Location { THE_INTERNET }

final locationValues = EnumValues({
    "The Internet": Location.THE_INTERNET
});

enum PrimaryAuthorName { GHOST }

final primaryAuthorNameValues = EnumValues({
    "Ghost": PrimaryAuthorName.GHOST
});

class Role {
    RoleId id;
    RoleName name;
    Description description;
    DateTime createdAt;
    DateTime updatedAt;

    Role({
        this.id,
        this.name,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : roleIdValues.map[json["id"]],
        name: json["name"] == null ? null : roleNameValues.map[json["name"]],
        description: json["description"] == null ? null : descriptionValues.map[json["description"]],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : roleIdValues.reverse[id],
        "name": name == null ? null : roleNameValues.reverse[name],
        "description": description == null ? null : descriptionValues.reverse[description],
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

enum Description { AUTHORS }

final descriptionValues = EnumValues({
    "Authors": Description.AUTHORS
});

enum RoleId { THE_5_E36_FEA282_DE68406_C28986_B }

final roleIdValues = EnumValues({
    "5e36fea282de68406c28986b": RoleId.THE_5_E36_FEA282_DE68406_C28986_B
});

enum RoleName { AUTHOR }

final roleNameValues = EnumValues({
    "Author": RoleName.AUTHOR
});

enum Status { ACTIVE }

final statusValues = EnumValues({
    "active": Status.ACTIVE
});

class Tag {
    PrimaryTagId id;
    PrimaryTagName name;
    Slug slug;
    dynamic description;
    dynamic featureImage;
    Visibility visibility;
    dynamic metaTitle;
    dynamic metaDescription;
    DateTime createdAt;
    DateTime updatedAt;
    String url;

    Tag({
        this.id,
        this.name,
        this.slug,
        this.description,
        this.featureImage,
        this.visibility,
        this.metaTitle,
        this.metaDescription,
        this.createdAt,
        this.updatedAt,
        this.url,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"] == null ? null : primaryTagIdValues.map[json["id"]],
        name: json["name"] == null ? null : primaryTagNameValues.map[json["name"]],
        slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
        description: json["description"],
        featureImage: json["feature_image"],
        visibility: json["visibility"] == null ? null : visibilityValues.map[json["visibility"]],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : primaryTagIdValues.reverse[id],
        "name": name == null ? null : primaryTagNameValues.reverse[name],
        "slug": slug == null ? null : slugValues.reverse[slug],
        "description": description,
        "feature_image": featureImage,
        "visibility": visibility == null ? null : visibilityValues.reverse[visibility],
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "url": url == null ? null : url,
    };
}

enum PrimaryTagId { THE_5_E36_FEA282_DE68406_C289868 }

final primaryTagIdValues = EnumValues({
    "5e36fea282de68406c289868": PrimaryTagId.THE_5_E36_FEA282_DE68406_C289868
});

enum PrimaryTagName { GETTING_STARTED }

final primaryTagNameValues = EnumValues({
    "Getting Started": PrimaryTagName.GETTING_STARTED
});

enum Slug { GETTING_STARTED }

final slugValues = EnumValues({
    "getting-started": Slug.GETTING_STARTED
});

enum Visibility { PUBLIC }

final visibilityValues = EnumValues({
    "public": Visibility.PUBLIC
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


