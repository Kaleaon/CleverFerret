.class Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath$UInt128;
.super Ljava/lang/Object;
.source "FastIntegerMath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UInt128"
.end annotation


# instance fields
.field final high:J

.field final low:J


# direct methods
.method private constructor <init>(JJ)V
    .locals 0

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput-wide p1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath$UInt128;->high:J

    .line 181
    iput-wide p3, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath$UInt128;->low:J

    return-void
.end method

.method synthetic constructor <init>(JJLcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath$1;)V
    .locals 0

    .line 176
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath$UInt128;-><init>(JJ)V

    return-void
.end method
