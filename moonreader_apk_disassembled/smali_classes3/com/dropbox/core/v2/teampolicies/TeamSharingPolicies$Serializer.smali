.class public Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "TeamSharingPolicies.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 184
    new-instance v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 183
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 211
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 212
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_d

    move-object v3, v0

    move-object v4, v3

    move-object v5, v4

    move-object v6, v5

    move-object v7, v6

    .line 220
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_6

    .line 221
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 222
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 223
    const-string v1, "shared_folder_member_policy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 224
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    move-result-object v0

    move-object v3, v0

    goto :goto_1

    .line 226
    :cond_1
    const-string v1, "shared_folder_join_policy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 227
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    move-result-object v0

    move-object v4, v0

    goto :goto_1

    .line 229
    :cond_2
    const-string v1, "shared_link_create_policy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 230
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    move-result-object v0

    move-object v5, v0

    goto :goto_1

    .line 232
    :cond_3
    const-string v1, "group_creation_policy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 233
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/GroupCreation$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/GroupCreation$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teampolicies/GroupCreation$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    move-result-object v0

    move-object v6, v0

    goto :goto_1

    .line 235
    :cond_4
    const-string v1, "shared_folder_link_restriction_policy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 236
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

    move-result-object v0

    move-object v7, v0

    goto :goto_1

    .line 239
    :cond_5
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_6
    if-eqz v3, :cond_c

    if-eqz v4, :cond_b

    if-eqz v5, :cond_a

    if-eqz v6, :cond_9

    if-eqz v7, :cond_8

    .line 257
    new-instance v2, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    invoke-direct/range {v2 .. v7}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;-><init>(Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;Lcom/dropbox/core/v2/teampolicies/GroupCreation;Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;)V

    if-nez p2, :cond_7

    .line 263
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 265
    :cond_7
    invoke-virtual {v2}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2

    .line 255
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"shared_folder_link_restriction_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 252
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"group_creation_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 249
    :cond_a
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"shared_link_create_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 246
    :cond_b
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"shared_folder_join_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 243
    :cond_c
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"shared_folder_member_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 260
    :cond_d
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "No subtype found that matches tag: \""

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 183
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 189
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 191
    :cond_0
    const-string v0, "shared_folder_member_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 192
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 193
    const-string v0, "shared_folder_join_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 195
    const-string v0, "shared_link_create_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 196
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 197
    const-string v0, "group_creation_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 198
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/GroupCreation$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/GroupCreation$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/GroupCreation$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/GroupCreation;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 199
    const-string v0, "shared_folder_link_restriction_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 200
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 202
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    :cond_1
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 183
    check-cast p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
