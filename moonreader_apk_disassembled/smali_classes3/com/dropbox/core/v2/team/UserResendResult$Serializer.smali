.class Lcom/dropbox/core/v2/team/UserResendResult$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "UserResendResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/UserResendResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/UserResendResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/UserResendResult$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 325
    new-instance v0, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserResendResult$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 324
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserResendResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 356
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 358
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 359
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 363
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 364
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 369
    const-string v3, "success"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 371
    sget-object v0, Lcom/dropbox/core/v2/team/UserResendEmailsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserResendEmailsResult$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/team/UserResendEmailsResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/team/UserResendEmailsResult;

    move-result-object v0

    .line 372
    invoke-static {v0}, Lcom/dropbox/core/v2/team/UserResendResult;->success(Lcom/dropbox/core/v2/team/UserResendEmailsResult;)Lcom/dropbox/core/v2/team/UserResendResult;

    move-result-object v0

    goto :goto_1

    .line 374
    :cond_1
    const-string v2, "invalid_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 376
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 377
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object v0

    .line 378
    invoke-static {v0}, Lcom/dropbox/core/v2/team/UserResendResult;->invalidUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserResendResult;

    move-result-object v0

    goto :goto_1

    .line 381
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/team/UserResendResult;->OTHER:Lcom/dropbox/core/v2/team/UserResendResult;

    :goto_1
    if-nez v1, :cond_3

    .line 384
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 385
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 367
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

    .line 324
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserResendResult;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/UserResendResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 329
    sget-object v0, Lcom/dropbox/core/v2/team/UserResendResult$1;->$SwitchMap$com$dropbox$core$v2$team$UserResendResult$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/UserResendResult;->tag()Lcom/dropbox/core/v2/team/UserResendResult$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/UserResendResult$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 346
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 338
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 339
    const-string v0, "invalid_user"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 340
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 341
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult;->access$100(Lcom/dropbox/core/v2/team/UserResendResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserSelectorArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 342
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 331
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 332
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 333
    sget-object v0, Lcom/dropbox/core/v2/team/UserResendEmailsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserResendEmailsResult$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserResendResult;->access$000(Lcom/dropbox/core/v2/team/UserResendResult;)Lcom/dropbox/core/v2/team/UserResendEmailsResult;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/team/UserResendEmailsResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserResendEmailsResult;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 334
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

    .line 324
    check-cast p1, Lcom/dropbox/core/v2/team/UserResendResult;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/UserResendResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserResendResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
