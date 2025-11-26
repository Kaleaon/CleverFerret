.class Lcom/dropbox/core/v2/team/Feature$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "Feature.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/Feature;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/Feature;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/Feature$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    new-instance v0, Lcom/dropbox/core/v2/team/Feature$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/Feature$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/Feature$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/Feature$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/Feature;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 85
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 87
    invoke-static {p1}, Lcom/dropbox/core/v2/team/Feature$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 88
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 92
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/Feature$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 93
    invoke-static {p1}, Lcom/dropbox/core/v2/team/Feature$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 98
    const-string v2, "upload_api_rate_limit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 99
    sget-object v0, Lcom/dropbox/core/v2/team/Feature;->UPLOAD_API_RATE_LIMIT:Lcom/dropbox/core/v2/team/Feature;

    goto :goto_1

    .line 101
    :cond_1
    const-string v2, "has_team_shared_dropbox"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 102
    sget-object v0, Lcom/dropbox/core/v2/team/Feature;->HAS_TEAM_SHARED_DROPBOX:Lcom/dropbox/core/v2/team/Feature;

    goto :goto_1

    .line 104
    :cond_2
    const-string v2, "has_team_file_events"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 105
    sget-object v0, Lcom/dropbox/core/v2/team/Feature;->HAS_TEAM_FILE_EVENTS:Lcom/dropbox/core/v2/team/Feature;

    goto :goto_1

    .line 107
    :cond_3
    const-string v2, "has_team_selective_sync"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 108
    sget-object v0, Lcom/dropbox/core/v2/team/Feature;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/Feature;

    goto :goto_1

    .line 111
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/team/Feature;->OTHER:Lcom/dropbox/core/v2/team/Feature;

    :goto_1
    if-nez v1, :cond_5

    .line 114
    invoke-static {p1}, Lcom/dropbox/core/v2/team/Feature$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 115
    invoke-static {p1}, Lcom/dropbox/core/v2/team/Feature$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 96
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

    .line 52
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/Feature$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/Feature;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/Feature;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 57
    sget-object v0, Lcom/dropbox/core/v2/team/Feature$1;->$SwitchMap$com$dropbox$core$v2$team$Feature:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/Feature;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 75
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 71
    :cond_0
    const-string p1, "has_team_selective_sync"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 67
    :cond_1
    const-string p1, "has_team_file_events"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 63
    :cond_2
    const-string p1, "has_team_shared_dropbox"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 59
    :cond_3
    const-string p1, "upload_api_rate_limit"

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

    .line 52
    check-cast p1, Lcom/dropbox/core/v2/team/Feature;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/Feature$Serializer;->serialize(Lcom/dropbox/core/v2/team/Feature;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
