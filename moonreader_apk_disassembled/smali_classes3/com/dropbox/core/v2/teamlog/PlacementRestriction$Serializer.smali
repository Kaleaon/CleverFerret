.class Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PlacementRestriction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/PlacementRestriction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/PlacementRestriction;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/PlacementRestriction;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 80
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 82
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 83
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 87
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 88
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_8

    .line 93
    const-string v2, "australia_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 94
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->AUSTRALIA_ONLY:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    goto :goto_1

    .line 96
    :cond_1
    const-string v2, "europe_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 97
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->EUROPE_ONLY:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    goto :goto_1

    .line 99
    :cond_2
    const-string v2, "japan_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 100
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->JAPAN_ONLY:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    goto :goto_1

    .line 102
    :cond_3
    const-string v2, "none"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 103
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->NONE:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    goto :goto_1

    .line 105
    :cond_4
    const-string v2, "uk_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 106
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->UK_ONLY:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    goto :goto_1

    .line 108
    :cond_5
    const-string v2, "us_s3_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 109
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->US_S3_ONLY:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    goto :goto_1

    .line 112
    :cond_6
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->OTHER:Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    :goto_1
    if-nez v1, :cond_7

    .line 115
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 116
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_7
    return-object v0

    .line 91
    :cond_8
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

    .line 39
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/PlacementRestriction;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 44
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$1;->$SwitchMap$com$dropbox$core$v2$teamlog$PlacementRestriction:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 70
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 66
    :pswitch_0
    const-string p1, "us_s3_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 62
    :pswitch_1
    const-string p1, "uk_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 58
    :pswitch_2
    const-string p1, "none"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 54
    :pswitch_3
    const-string p1, "japan_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 50
    :pswitch_4
    const-string p1, "europe_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 46
    :pswitch_5
    const-string p1, "australia_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 39
    check-cast p1, Lcom/dropbox/core/v2/teamlog/PlacementRestriction;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/PlacementRestriction$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/PlacementRestriction;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
