.class Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "CustomQuotaResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/CustomQuotaResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/CustomQuotaResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 307
    new-instance v0, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 306
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/CustomQuotaResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 338
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 340
    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 341
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 345
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 346
    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 351
    const-string v3, "success"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 353
    sget-object v0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/team/UserCustomQuotaResult;

    move-result-object v0

    .line 354
    invoke-static {v0}, Lcom/dropbox/core/v2/team/CustomQuotaResult;->success(Lcom/dropbox/core/v2/team/UserCustomQuotaResult;)Lcom/dropbox/core/v2/team/CustomQuotaResult;

    move-result-object v0

    goto :goto_1

    .line 356
    :cond_1
    const-string v2, "invalid_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 358
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 359
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object v0

    .line 360
    invoke-static {v0}, Lcom/dropbox/core/v2/team/CustomQuotaResult;->invalidUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/CustomQuotaResult;

    move-result-object v0

    goto :goto_1

    .line 363
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/team/CustomQuotaResult;->OTHER:Lcom/dropbox/core/v2/team/CustomQuotaResult;

    :goto_1
    if-nez v1, :cond_3

    .line 366
    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 367
    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 349
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

    .line 306
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/CustomQuotaResult;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/CustomQuotaResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 311
    sget-object v0, Lcom/dropbox/core/v2/team/CustomQuotaResult$1;->$SwitchMap$com$dropbox$core$v2$team$CustomQuotaResult$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult;->tag()Lcom/dropbox/core/v2/team/CustomQuotaResult$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 328
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 320
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 321
    const-string v0, "invalid_user"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 322
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 323
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult;->access$100(Lcom/dropbox/core/v2/team/CustomQuotaResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserSelectorArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 324
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 313
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 314
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 315
    sget-object v0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/CustomQuotaResult;->access$000(Lcom/dropbox/core/v2/team/CustomQuotaResult;)Lcom/dropbox/core/v2/team/UserCustomQuotaResult;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserCustomQuotaResult;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 316
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

    .line 306
    check-cast p1, Lcom/dropbox/core/v2/team/CustomQuotaResult;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/CustomQuotaResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/CustomQuotaResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
