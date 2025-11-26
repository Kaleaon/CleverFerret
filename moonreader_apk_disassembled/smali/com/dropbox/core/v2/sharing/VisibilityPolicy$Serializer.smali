.class Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "VisibilityPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/VisibilityPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 184
    new-instance v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 183
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/sharing/VisibilityPolicy;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 211
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 212
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_a

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    .line 219
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_5

    .line 220
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 221
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 222
    const-string v5, "policy"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 223
    sget-object v0, Lcom/dropbox/core/v2/sharing/RequestedVisibility$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RequestedVisibility$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/RequestedVisibility$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    move-result-object v0

    goto :goto_1

    .line 225
    :cond_1
    const-string v5, "resolved_policy"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 226
    sget-object v1, Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    move-result-object v1

    goto :goto_1

    .line 228
    :cond_2
    const-string v5, "allowed"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 229
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->boolean_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    goto :goto_1

    .line 231
    :cond_3
    const-string v5, "disallowed_reason"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 232
    sget-object v3, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;

    invoke-static {v3}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 235
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_9

    if-eqz v1, :cond_8

    if-eqz v2, :cond_7

    .line 247
    new-instance v4, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;-><init>(Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;ZLcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;)V

    if-nez p2, :cond_6

    .line 253
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 255
    :cond_6
    invoke-virtual {v4}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v4

    .line 245
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"allowed\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 242
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"resolved_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 239
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 250
    :cond_a
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

    .line 183
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/sharing/VisibilityPolicy;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/sharing/VisibilityPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 189
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 191
    :cond_0
    const-string v0, "policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 192
    sget-object v0, Lcom/dropbox/core/v2/sharing/RequestedVisibility$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RequestedVisibility$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/sharing/RequestedVisibility$Serializer;->serialize(Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 193
    const-string v0, "resolved_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    sget-object v0, Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility$Serializer;->serialize(Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 195
    const-string v0, "allowed"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 196
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->boolean_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-boolean v1, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->allowed:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 197
    iget-object v0, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    if-eqz v0, :cond_1

    .line 198
    const-string v0, "disallowed_reason"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 199
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    :cond_1
    if-nez p3, :cond_2

    .line 202
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    :cond_2
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

    .line 183
    check-cast p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/sharing/VisibilityPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
