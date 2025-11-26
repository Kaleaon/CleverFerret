.class Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "MembersSetProfilePhotoError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 291
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 290
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 327
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 329
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 330
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 334
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 335
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 340
    const-string v2, "user_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 341
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    goto :goto_1

    .line 343
    :cond_1
    const-string v2, "user_not_in_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 344
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    goto :goto_1

    .line 346
    :cond_2
    const-string v2, "set_profile_disallowed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 347
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->SET_PROFILE_DISALLOWED:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    goto :goto_1

    .line 349
    :cond_3
    const-string v2, "photo_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 351
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 352
    sget-object v0, Lcom/dropbox/core/v2/account/SetProfilePhotoError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/account/SetProfilePhotoError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/account/SetProfilePhotoError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    move-result-object v0

    .line 353
    invoke-static {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoError(Lcom/dropbox/core/v2/account/SetProfilePhotoError;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object v0

    goto :goto_1

    .line 356
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->OTHER:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    :goto_1
    if-nez v1, :cond_5

    .line 359
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 360
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 338
    :cond_6
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

    .line 290
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 295
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$1;->$SwitchMap$com$dropbox$core$v2$team$MembersSetProfilePhotoError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->tag()Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 317
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 309
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 310
    const-string v0, "photo_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 311
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 312
    sget-object v0, Lcom/dropbox/core/v2/account/SetProfilePhotoError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/account/SetProfilePhotoError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->access$000(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;)Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/account/SetProfilePhotoError$Serializer;->serialize(Lcom/dropbox/core/v2/account/SetProfilePhotoError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 313
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 305
    :cond_1
    const-string p1, "set_profile_disallowed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 301
    :cond_2
    const-string p1, "user_not_in_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 297
    :cond_3
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

    .line 290
    check-cast p1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->serialize(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
