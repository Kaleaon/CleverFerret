.class Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "MembersSetPermissions2Error.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 57
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 93
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 95
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 96
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 100
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 101
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_7

    .line 106
    const-string v2, "user_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 107
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    goto :goto_1

    .line 109
    :cond_1
    const-string v2, "last_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 110
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->LAST_ADMIN:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    goto :goto_1

    .line 112
    :cond_2
    const-string v2, "user_not_in_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 113
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    goto :goto_1

    .line 115
    :cond_3
    const-string v2, "cannot_set_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 116
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->CANNOT_SET_PERMISSIONS:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    goto :goto_1

    .line 118
    :cond_4
    const-string v2, "role_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 119
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->ROLE_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    goto :goto_1

    .line 122
    :cond_5
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->OTHER:Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    :goto_1
    if-nez v1, :cond_6

    .line 125
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 126
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_6
    return-object v0

    .line 104
    :cond_7
    new-instance v0, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v1, "Required field missing: .tag"

    invoke-direct {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 56
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 61
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$1;->$SwitchMap$com$dropbox$core$v2$team$MembersSetPermissions2Error:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 83
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 79
    :cond_0
    const-string p1, "role_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 75
    :cond_1
    const-string p1, "cannot_set_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 71
    :cond_2
    const-string p1, "user_not_in_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 67
    :cond_3
    const-string p1, "last_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 63
    :cond_4
    const-string p1, "user_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 56
    check-cast p1, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/MembersSetPermissions2Error$Serializer;->serialize(Lcom/dropbox/core/v2/team/MembersSetPermissions2Error;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
