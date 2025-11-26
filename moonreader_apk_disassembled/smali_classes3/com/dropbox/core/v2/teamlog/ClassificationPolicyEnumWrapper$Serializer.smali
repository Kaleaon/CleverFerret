.class Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "ClassificationPolicyEnumWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 73
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 75
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 76
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 80
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 81
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 86
    const-string v2, "disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 87
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;->DISABLED:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    goto :goto_1

    .line 89
    :cond_1
    const-string v2, "enabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 90
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;->ENABLED:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    goto :goto_1

    .line 92
    :cond_2
    const-string v2, "member_and_team_folders"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 93
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;->MEMBER_AND_TEAM_FOLDERS:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    goto :goto_1

    .line 95
    :cond_3
    const-string v2, "team_folders"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 96
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;->TEAM_FOLDERS:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    goto :goto_1

    .line 99
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;->OTHER:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    :goto_1
    if-nez v1, :cond_5

    .line 102
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 103
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 84
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

    .line 40
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 45
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$1;->$SwitchMap$com$dropbox$core$v2$teamlog$ClassificationPolicyEnumWrapper:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;->ordinal()I

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

    .line 63
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 59
    :cond_0
    const-string p1, "team_folders"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 55
    :cond_1
    const-string p1, "member_and_team_folders"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 51
    :cond_2
    const-string p1, "enabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 47
    :cond_3
    const-string p1, "disabled"

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

    .line 40
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
