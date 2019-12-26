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
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Meta {
    Pagination pagination;

    Meta({
        this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
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
        page: json["page"],
        limit: json["limit"],
        pages: json["pages"],
        total: json["total"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "pages": pages,
        "total": total,
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
    String visibility;
    bool sendEmailWhenPublished;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    dynamic customExcerpt;
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
        id: json["id"],
        uuid: json["uuid"],
        title: json["title"],
        slug: json["slug"],
        html: json["html"],
        commentId: json["comment_id"],
        featureImage: json["feature_image"] == null ? null : json["feature_image"],
        featured: json["featured"],
        status: json["status"],
        visibility: json["visibility"],
        sendEmailWhenPublished: json["send_email_when_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        customExcerpt: json["custom_excerpt"],
        codeinjectionHead: json["codeinjection_head"],
        codeinjectionFoot: json["codeinjection_foot"],
        customTemplate: json["custom_template"],
        canonicalUrl: json["canonical_url"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        primaryAuthor: Author.fromJson(json["primary_author"]),
        primaryTag: json["primary_tag"] == null ? null : Tag.fromJson(json["primary_tag"]),
        url: json["url"],
        excerpt: json["excerpt"],
        readingTime: json["reading_time"],
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
        "id": id,
        "uuid": uuid,
        "title": title,
        "slug": slug,
        "html": html,
        "comment_id": commentId,
        "feature_image": featureImage == null ? null : featureImage,
        "featured": featured,
        "status": status,
        "visibility": visibility,
        "send_email_when_published": sendEmailWhenPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "published_at": publishedAt == null ? null : publishedAt.toIso8601String(),
        "custom_excerpt": customExcerpt,
        "codeinjection_head": codeinjectionHead,
        "codeinjection_foot": codeinjectionFoot,
        "custom_template": customTemplate,
        "canonical_url": canonicalUrl,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "primary_author": primaryAuthor.toJson(),
        "primary_tag": primaryTag == null ? null : primaryTag.toJson(),
        "url": url,
        "excerpt": excerpt,
        "reading_time": readingTime,
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
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
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
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "url": url,
    };
}

class Role {
    String id;
    String name;
    String description;
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
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Tag {
    String id;
    String name;
    String slug;
    dynamic description;
    dynamic featureImage;
    String visibility;
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
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        featureImage: json["feature_image"],
        visibility: json["visibility"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "feature_image": featureImage,
        "visibility": visibility,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
    };
}
