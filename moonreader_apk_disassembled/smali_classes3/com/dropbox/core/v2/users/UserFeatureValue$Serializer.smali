.class Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "UserFeatureValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/users/UserFeatureValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/users/UserFeatureValue;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 297
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 296
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/users/UserFeatureValue;
    .locals 4
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

    if-ne v0, v1, :cond_0

    .line 331
    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 332
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 336
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 337
    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 342
    const-string v2, "paper_as_files"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 344
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 345
    sget-object v0, Lcom/dropbox/core/v2/users/PaperAsFilesValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/PaperAsFilesValue$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/users/PaperAsFilesValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    move-result-object v0

    .line 346
    invoke-static {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFiles(Lcom/dropbox/core/v2/users/PaperAsFilesValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;

    move-result-object v0

    goto :goto_1

    .line 348
    :cond_1
    const-string v2, "file_locking"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 350
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 351
    sget-object v0, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/users/FileLockingValue;

    move-result-object v0

    .line 352
    invoke-static {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLocking(Lcom/dropbox/core/v2/users/FileLockingValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;

    move-result-object v0

    goto :goto_1

    .line 355
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->OTHER:Lcom/dropbox/core/v2/users/UserFeatureValue;

    :goto_1
    if-nez v1, :cond_3

    .line 358
    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 359
    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

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

    .line 296
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/users/UserFeatureValue;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/users/UserFeatureValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 301
    sget-object v0, Lcom/dropbox/core/v2/users/UserFeatureValue$1;->$SwitchMap$com$dropbox$core$v2$users$UserFeatureValue$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue;->tag()Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 319
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 311
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 312
    const-string v0, "file_locking"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 313
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 314
    sget-object v0, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue;->access$100(Lcom/dropbox/core/v2/users/UserFeatureValue;)Lcom/dropbox/core/v2/users/FileLockingValue;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->serialize(Lcom/dropbox/core/v2/users/FileLockingValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 315
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 303
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 304
    const-string v0, "paper_as_files"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 305
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 306
    sget-object v0, Lcom/dropbox/core/v2/users/PaperAsFilesValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/PaperAsFilesValue$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/users/UserFeatureValue;->access$000(Lcom/dropbox/core/v2/users/UserFeatureValue;)Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/users/PaperAsFilesValue$Serializer;->serialize(Lcom/dropbox/core/v2/users/PaperAsFilesValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 307
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

    .line 296
    check-cast p1, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->serialize(Lcom/dropbox/core/v2/users/UserFeatureValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
