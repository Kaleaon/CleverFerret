.class Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "DeleteBatchJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 324
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 323
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 359
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 361
    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 362
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 366
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 367
    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 372
    const-string v3, "in_progress"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 373
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    goto :goto_1

    .line 375
    :cond_1
    const-string v3, "complete"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 377
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchResult$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/files/DeleteBatchResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/DeleteBatchResult;

    move-result-object v0

    .line 378
    invoke-static {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->complete(Lcom/dropbox/core/v2/files/DeleteBatchResult;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object v0

    goto :goto_1

    .line 380
    :cond_2
    const-string v2, "failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 382
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 383
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/DeleteBatchError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/DeleteBatchError;

    move-result-object v0

    .line 384
    invoke-static {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failed(Lcom/dropbox/core/v2/files/DeleteBatchError;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object v0

    goto :goto_1

    .line 387
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->OTHER:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    :goto_1
    if-nez v1, :cond_4

    .line 390
    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 391
    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 370
    :cond_5
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

    .line 323
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 328
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$1;->$SwitchMap$com$dropbox$core$v2$files$DeleteBatchJobStatus$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->tag()Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 349
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 341
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 342
    const-string v0, "failed"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 343
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 344
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->access$100(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;)Lcom/dropbox/core/v2/files/DeleteBatchError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/DeleteBatchError$Serializer;->serialize(Lcom/dropbox/core/v2/files/DeleteBatchError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 345
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 334
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 335
    const-string v0, "complete"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 336
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchResult$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->access$000(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;)Lcom/dropbox/core/v2/files/DeleteBatchResult;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/files/DeleteBatchResult$Serializer;->serialize(Lcom/dropbox/core/v2/files/DeleteBatchResult;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 337
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 330
    :cond_2
    const-string p1, "in_progress"

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

    .line 323
    check-cast p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->serialize(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
