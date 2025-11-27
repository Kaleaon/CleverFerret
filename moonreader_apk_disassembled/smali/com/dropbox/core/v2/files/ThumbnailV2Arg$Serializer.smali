.class Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "ThumbnailV2Arg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/ThumbnailV2Arg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/files/ThumbnailV2Arg;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 313
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 312
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/ThumbnailV2Arg;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 338
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 339
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_8

    .line 343
    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailFormat;->JPEG:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    .line 344
    sget-object v2, Lcom/dropbox/core/v2/files/ThumbnailSize;->W64H64:Lcom/dropbox/core/v2/files/ThumbnailSize;

    .line 345
    sget-object v3, Lcom/dropbox/core/v2/files/ThumbnailMode;->STRICT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    .line 346
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_5

    .line 347
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 348
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 349
    const-string v5, "resource"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 350
    sget-object v0, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PathOrLink$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PathOrLink;

    move-result-object v0

    goto :goto_1

    .line 352
    :cond_1
    const-string v5, "format"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 353
    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailFormat$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailFormat$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/files/ThumbnailFormat$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/ThumbnailFormat;

    move-result-object v1

    goto :goto_1

    .line 355
    :cond_2
    const-string v5, "size"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 356
    sget-object v2, Lcom/dropbox/core/v2/files/ThumbnailSize$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailSize$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/ThumbnailSize$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/ThumbnailSize;

    move-result-object v2

    goto :goto_1

    .line 358
    :cond_3
    const-string v5, "mode"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 359
    sget-object v3, Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;

    invoke-virtual {v3, p1}, Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/ThumbnailMode;

    move-result-object v3

    goto :goto_1

    .line 362
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_7

    .line 368
    new-instance v4, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;-><init>(Lcom/dropbox/core/v2/files/PathOrLink;Lcom/dropbox/core/v2/files/ThumbnailFormat;Lcom/dropbox/core/v2/files/ThumbnailSize;Lcom/dropbox/core/v2/files/ThumbnailMode;)V

    if-nez p2, :cond_6

    .line 374
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 376
    :cond_6
    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v4

    .line 366
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"resource\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 371
    :cond_8
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

    .line 312
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/ThumbnailV2Arg;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/ThumbnailV2Arg;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 318
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 320
    :cond_0
    const-string v0, "resource"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 321
    sget-object v0, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PathOrLink$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->resource:Lcom/dropbox/core/v2/files/PathOrLink;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/files/PathOrLink$Serializer;->serialize(Lcom/dropbox/core/v2/files/PathOrLink;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 322
    const-string v0, "format"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 323
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailFormat$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailFormat$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/files/ThumbnailFormat$Serializer;->serialize(Lcom/dropbox/core/v2/files/ThumbnailFormat;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 324
    const-string v0, "size"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 325
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailSize$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailSize$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/files/ThumbnailSize$Serializer;->serialize(Lcom/dropbox/core/v2/files/ThumbnailSize;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 326
    const-string v0, "mode"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 327
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;->serialize(Lcom/dropbox/core/v2/files/ThumbnailMode;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 329
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

    .line 312
    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->serialize(Lcom/dropbox/core/v2/files/ThumbnailV2Arg;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
