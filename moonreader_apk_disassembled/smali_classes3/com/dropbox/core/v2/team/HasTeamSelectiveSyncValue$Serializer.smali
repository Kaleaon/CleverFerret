.class Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "HasTeamSelectiveSyncValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 228
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 227
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 252
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 254
    invoke-static {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 255
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 259
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 260
    invoke-static {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 265
    const-string v2, "has_team_selective_sync"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 267
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 268
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->boolean_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 269
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSync(Z)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    move-result-object v0

    goto :goto_1

    .line 272
    :cond_1
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->OTHER:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    :goto_1
    if-nez v1, :cond_2

    .line 275
    invoke-static {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 276
    invoke-static {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_2
    return-object v0

    .line 263
    :cond_3
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

    .line 227
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 232
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$1;->$SwitchMap$com$dropbox$core$v2$team$HasTeamSelectiveSyncValue$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->tag()Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 242
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 234
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 235
    const-string v0, "has_team_selective_sync"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 236
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 237
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->boolean_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->access$000(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 238
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

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

    .line 227
    check-cast p1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->serialize(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
