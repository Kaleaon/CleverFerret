.class Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LinkedDeviceLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 460
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 459
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 504
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 506
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 507
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 511
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 512
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 517
    const-string v3, "desktop_device_session"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 519
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    move-result-object v0

    .line 520
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSession(Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object v0

    goto :goto_1

    .line 522
    :cond_1
    const-string v3, "legacy_device_session"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 524
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    move-result-object v0

    .line 525
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSession(Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object v0

    goto :goto_1

    .line 527
    :cond_2
    const-string v3, "mobile_device_session"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 529
    sget-object v0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    move-result-object v0

    .line 530
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSession(Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object v0

    goto :goto_1

    .line 532
    :cond_3
    const-string v3, "web_device_session"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 534
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    move-result-object v0

    .line 535
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSession(Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object v0

    goto :goto_1

    .line 538
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    :goto_1
    if-nez v1, :cond_5

    .line 541
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 542
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 515
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

    .line 459
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 464
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$LinkedDeviceLogInfo$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->tag()Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    .line 494
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 487
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 488
    const-string v0, "web_device_session"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 489
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->access$300(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 490
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 480
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 481
    const-string v0, "mobile_device_session"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 482
    sget-object v0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->access$200(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 483
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 473
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 474
    const-string v0, "legacy_device_session"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 475
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->access$100(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 476
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 466
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 467
    const-string v0, "desktop_device_session"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 468
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->access$000(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 469
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

    .line 459
    check-cast p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
