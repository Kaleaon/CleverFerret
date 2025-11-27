.class Lcom/dropbox/core/v2/files/PathOrLink$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PathOrLink.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/PathOrLink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/PathOrLink;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/PathOrLink$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 298
    new-instance v0, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PathOrLink$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 297
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PathOrLink;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 329
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 331
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 332
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 336
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 337
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 342
    const-string v3, "path"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 344
    invoke-static {v3, p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 345
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 346
    invoke-static {v0}, Lcom/dropbox/core/v2/files/PathOrLink;->path(Ljava/lang/String;)Lcom/dropbox/core/v2/files/PathOrLink;

    move-result-object v0

    goto :goto_1

    .line 348
    :cond_1
    const-string v3, "link"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 350
    sget-object v0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/SharedLinkFileInfo;

    move-result-object v0

    .line 351
    invoke-static {v0}, Lcom/dropbox/core/v2/files/PathOrLink;->link(Lcom/dropbox/core/v2/files/SharedLinkFileInfo;)Lcom/dropbox/core/v2/files/PathOrLink;

    move-result-object v0

    goto :goto_1

    .line 354
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/files/PathOrLink;->OTHER:Lcom/dropbox/core/v2/files/PathOrLink;

    :goto_1
    if-nez v1, :cond_3

    .line 357
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 358
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 340
    :cond_4
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

    .line 297
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PathOrLink;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/PathOrLink;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 302
    sget-object v0, Lcom/dropbox/core/v2/files/PathOrLink$1;->$SwitchMap$com$dropbox$core$v2$files$PathOrLink$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/PathOrLink;->tag()Lcom/dropbox/core/v2/files/PathOrLink$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/PathOrLink$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 319
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 312
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 313
    const-string v0, "link"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 314
    sget-object v0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink;->access$100(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/v2/files/SharedLinkFileInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->serialize(Lcom/dropbox/core/v2/files/SharedLinkFileInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 315
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 304
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 305
    const-string v0, "path"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 306
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 307
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/files/PathOrLink;->access$000(Lcom/dropbox/core/v2/files/PathOrLink;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 308
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

    .line 297
    check-cast p1, Lcom/dropbox/core/v2/files/PathOrLink;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->serialize(Lcom/dropbox/core/v2/files/PathOrLink;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
