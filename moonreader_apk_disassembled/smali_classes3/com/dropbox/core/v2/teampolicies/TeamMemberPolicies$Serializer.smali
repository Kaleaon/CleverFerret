.class public Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "TeamMemberPolicies.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 174
    new-instance v0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 173
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 199
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 200
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_b

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    .line 207
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_5

    .line 208
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 209
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 210
    const-string v5, "sharing"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 211
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    goto :goto_1

    .line 213
    :cond_1
    const-string v5, "emm_state"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 214
    sget-object v1, Lcom/dropbox/core/v2/teampolicies/EmmState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/EmmState$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teampolicies/EmmState$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/EmmState;

    move-result-object v1

    goto :goto_1

    .line 216
    :cond_2
    const-string v5, "office_addin"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 217
    sget-object v2, Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    move-result-object v2

    goto :goto_1

    .line 219
    :cond_3
    const-string v5, "suggest_members_policy"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 220
    sget-object v3, Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy$Serializer;

    invoke-virtual {v3, p1}, Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

    move-result-object v3

    goto :goto_1

    .line 223
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_a

    if-eqz v1, :cond_9

    if-eqz v2, :cond_8

    if-eqz v3, :cond_7

    .line 238
    new-instance v4, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;-><init>(Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;Lcom/dropbox/core/v2/teampolicies/EmmState;Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;)V

    if-nez p2, :cond_6

    .line 244
    invoke-static {p1}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 246
    :cond_6
    invoke-virtual {v4}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v4

    .line 236
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"suggest_members_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 233
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"office_addin\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 230
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"emm_state\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 227
    :cond_a
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"sharing\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 241
    :cond_b
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

    .line 173
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 179
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 181
    :cond_0
    const-string v0, "sharing"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 182
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 183
    const-string v0, "emm_state"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 184
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/EmmState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/EmmState$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/EmmState$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/EmmState;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 185
    const-string v0, "office_addin"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 186
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 187
    const-string v0, "suggest_members_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 188
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 190
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

    .line 173
    check-cast p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->serialize(Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
