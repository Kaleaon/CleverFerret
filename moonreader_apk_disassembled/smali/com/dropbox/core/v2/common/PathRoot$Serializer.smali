.class public Lcom/dropbox/core/v2/common/PathRoot$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PathRoot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/common/PathRoot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/common/PathRoot;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/common/PathRoot$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 351
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/PathRoot$Serializer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 350
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/common/PathRoot;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 387
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 389
    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 390
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 394
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 395
    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 400
    const-string v2, "home"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 401
    sget-object v0, Lcom/dropbox/core/v2/common/PathRoot;->HOME:Lcom/dropbox/core/v2/common/PathRoot;

    goto :goto_1

    .line 403
    :cond_1
    const-string v2, "root"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 405
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 406
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 407
    invoke-static {v0}, Lcom/dropbox/core/v2/common/PathRoot;->root(Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object v0

    goto :goto_1

    .line 409
    :cond_2
    const-string v2, "namespace_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 411
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 412
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 413
    invoke-static {v0}, Lcom/dropbox/core/v2/common/PathRoot;->namespaceId(Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object v0

    goto :goto_1

    .line 416
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/common/PathRoot;->OTHER:Lcom/dropbox/core/v2/common/PathRoot;

    :goto_1
    if-nez v1, :cond_4

    .line 419
    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 420
    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 398
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

    .line 350
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/common/PathRoot;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 355
    sget-object v0, Lcom/dropbox/core/v2/common/PathRoot$1;->$SwitchMap$com$dropbox$core$v2$common$PathRoot$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/common/PathRoot;->tag()Lcom/dropbox/core/v2/common/PathRoot$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/common/PathRoot$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 377
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 369
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 370
    const-string v0, "namespace_id"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 371
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 372
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot;->access$100(Lcom/dropbox/core/v2/common/PathRoot;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 373
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 361
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 362
    const-string v0, "root"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 363
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 364
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/common/PathRoot;->access$000(Lcom/dropbox/core/v2/common/PathRoot;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 365
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 357
    :cond_2
    const-string p1, "home"

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

    .line 350
    check-cast p1, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->serialize(Lcom/dropbox/core/v2/common/PathRoot;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
