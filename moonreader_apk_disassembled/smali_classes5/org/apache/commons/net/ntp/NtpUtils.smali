.class public final Lorg/apache/commons/net/ntp/NtpUtils;
.super Ljava/lang/Object;
.source "NtpUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getHostAddress(I)Ljava/lang/String;
    .locals 3

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    ushr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    ushr-int/lit8 v2, p0, 0x10

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    ushr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    and-int/lit16 p0, p0, 0xff

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getModeName(I)Ljava/lang/String;
    .locals 0

    packed-switch p0, :pswitch_data_0

    .line 111
    const-string p0, "Unknown"

    return-object p0

    .line 109
    :pswitch_0
    const-string p0, "Private"

    return-object p0

    .line 107
    :pswitch_1
    const-string p0, "Control"

    return-object p0

    .line 105
    :pswitch_2
    const-string p0, "Broadcast"

    return-object p0

    .line 103
    :pswitch_3
    const-string p0, "Server"

    return-object p0

    .line 101
    :pswitch_4
    const-string p0, "Client"

    return-object p0

    .line 99
    :pswitch_5
    const-string p0, "Symmetric Passive"

    return-object p0

    .line 97
    :pswitch_6
    const-string p0, "Symmetric Active"

    return-object p0

    .line 95
    :pswitch_7
    const-string p0, "Reserved"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getRefAddress(Lorg/apache/commons/net/ntp/NtpV3Packet;)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 48
    :cond_0
    invoke-interface {p0}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getReferenceId()I

    move-result p0

    .line 49
    :goto_0
    invoke-static {p0}, Lorg/apache/commons/net/ntp/NtpUtils;->getHostAddress(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getReferenceClock(Lorg/apache/commons/net/ntp/NtpV3Packet;)Ljava/lang/String;
    .locals 5

    .line 62
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 65
    :cond_0
    invoke-interface {p0}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getReferenceId()I

    move-result p0

    if-nez p0, :cond_1

    return-object v0

    .line 69
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v2, 0x18

    :goto_0
    if-ltz v2, :cond_4

    ushr-int v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    int-to-char v3, v3

    if-nez v3, :cond_2

    goto :goto_1

    .line 77
    :cond_2
    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v4

    if-nez v4, :cond_3

    return-object v0

    .line 80
    :cond_3
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, -0x8

    goto :goto_0

    .line 82
    :cond_4
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
