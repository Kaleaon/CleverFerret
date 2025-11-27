.class public interface abstract Lorg/apache/commons/net/ntp/NtpV3Packet;
.super Ljava/lang/Object;
.source "NtpV3Packet.java"


# static fields
.field public static final LI_ALARM_CONDITION:I = 0x3

.field public static final LI_LAST_MINUTE_HAS_59_SECONDS:I = 0x2

.field public static final LI_LAST_MINUTE_HAS_61_SECONDS:I = 0x1

.field public static final LI_NO_WARNING:I = 0x0

.field public static final MODE_BROADCAST:I = 0x5

.field public static final MODE_CLIENT:I = 0x3

.field public static final MODE_CONTROL_MESSAGE:I = 0x6

.field public static final MODE_PRIVATE:I = 0x7

.field public static final MODE_RESERVED:I = 0x0

.field public static final MODE_SERVER:I = 0x4

.field public static final MODE_SYMMETRIC_ACTIVE:I = 0x1

.field public static final MODE_SYMMETRIC_PASSIVE:I = 0x2

.field public static final NTP_MAXCLOCK:I = 0xa

.field public static final NTP_MAXPOLL:I = 0xe

.field public static final NTP_MINCLOCK:I = 0x1

.field public static final NTP_MINPOLL:I = 0x4

.field public static final NTP_PORT:I = 0x7b

.field public static final TYPE_DAYTIME:Ljava/lang/String; = "DAYTIME"

.field public static final TYPE_ICMP:Ljava/lang/String; = "ICMP"

.field public static final TYPE_NTP:Ljava/lang/String; = "NTP"

.field public static final TYPE_TIME:Ljava/lang/String; = "TIME"

.field public static final VERSION_3:I = 0x3

.field public static final VERSION_4:I = 0x4


# virtual methods
.method public abstract getDatagramPacket()Ljava/net/DatagramPacket;
.end method

.method public abstract getLeapIndicator()I
.end method

.method public abstract getMode()I
.end method

.method public abstract getModeName()Ljava/lang/String;
.end method

.method public abstract getOriginateTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
.end method

.method public abstract getPoll()I
.end method

.method public abstract getPrecision()I
.end method

.method public abstract getReceiveTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
.end method

.method public abstract getReferenceId()I
.end method

.method public abstract getReferenceIdString()Ljava/lang/String;
.end method

.method public abstract getReferenceTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
.end method

.method public abstract getRootDelay()I
.end method

.method public abstract getRootDelayInMillisDouble()D
.end method

.method public abstract getRootDispersion()I
.end method

.method public abstract getRootDispersionInMillis()J
.end method

.method public abstract getRootDispersionInMillisDouble()D
.end method

.method public abstract getStratum()I
.end method

.method public abstract getTransmitTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
.end method

.method public abstract getType()Ljava/lang/String;
.end method

.method public abstract getVersion()I
.end method

.method public abstract setDatagramPacket(Ljava/net/DatagramPacket;)V
.end method

.method public abstract setLeapIndicator(I)V
.end method

.method public abstract setMode(I)V
.end method

.method public abstract setOriginateTimeStamp(Lorg/apache/commons/net/ntp/TimeStamp;)V
.end method

.method public abstract setPoll(I)V
.end method

.method public abstract setPrecision(I)V
.end method

.method public abstract setReceiveTimeStamp(Lorg/apache/commons/net/ntp/TimeStamp;)V
.end method

.method public abstract setReferenceId(I)V
.end method

.method public abstract setReferenceTime(Lorg/apache/commons/net/ntp/TimeStamp;)V
.end method

.method public abstract setRootDelay(I)V
.end method

.method public abstract setRootDispersion(I)V
.end method

.method public abstract setStratum(I)V
.end method

.method public abstract setTransmitTime(Lorg/apache/commons/net/ntp/TimeStamp;)V
.end method

.method public abstract setVersion(I)V
.end method
