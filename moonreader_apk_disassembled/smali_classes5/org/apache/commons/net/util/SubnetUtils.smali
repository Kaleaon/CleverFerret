.class public Lorg/apache/commons/net/util/SubnetUtils;
.super Ljava/lang/Object;
.source "SubnetUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;
    }
.end annotation


# static fields
.field private static final IP_ADDRESS:Ljava/lang/String; = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})"

.field private static final NBITS:I = 0x20

.field private static final PARSE_FAIL:Ljava/lang/String; = "Could not parse [%s]"

.field private static final SLASH_FORMAT:Ljava/lang/String; = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})"

.field private static final addressPattern:Ljava/util/regex/Pattern;

.field private static final cidrPattern:Ljava/util/regex/Pattern;


# instance fields
.field private final address:I

.field private final broadcast:I

.field private inclusiveHostCount:Z

.field private final netmask:I

.field private final network:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-string v0, "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/util/SubnetUtils;->addressPattern:Ljava/util/regex/Pattern;

    .line 32
    const-string v0, "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/util/SubnetUtils;->cidrPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    sget-object v0, Lorg/apache/commons/net/util/SubnetUtils;->cidrPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 56
    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->matchAddress(Ljava/util/regex/Matcher;)I

    move-result p1

    iput p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    const/4 v1, 0x5

    .line 60
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x20

    invoke-static {v0, v2, v1}, Lorg/apache/commons/net/util/SubnetUtils;->rangeCheck(III)I

    move-result v0

    sub-int/2addr v1, v0

    const-wide v2, 0xffffffffL

    shl-long v0, v2, v1

    long-to-int v1, v0

    .line 69
    iput v1, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    and-int/2addr p1, v1

    .line 72
    iput p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    not-int v0, v1

    or-int/2addr p1, v0

    .line 75
    iput p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    return-void

    .line 77
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v2

    const-string p1, "Could not parse [%s]"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-static {p1}, Lorg/apache/commons/net/util/SubnetUtils;->toInteger(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    .line 90
    invoke-static {p2}, Lorg/apache/commons/net/util/SubnetUtils;->toInteger(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    neg-int v1, v0

    and-int/2addr v1, v0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    not-int v3, v0

    if-ne v1, v3, :cond_0

    and-int/2addr p1, v0

    .line 97
    iput p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    not-int p2, v0

    or-int/2addr p1, p2

    .line 100
    iput p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    return-void

    .line 93
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-array v0, v2, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const-string p2, "Could not parse [%s]"

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 0

    .line 27
    iget p0, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    return p0
.end method

.method static synthetic access$100(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 0

    .line 27
    iget p0, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    return p0
.end method

.method static synthetic access$200(Ljava/lang/String;)I
    .locals 0

    .line 27
    invoke-static {p0}, Lorg/apache/commons/net/util/SubnetUtils;->toInteger(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 0

    .line 27
    iget p0, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    return p0
.end method

.method static synthetic access$400(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 0

    .line 27
    iget p0, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    return p0
.end method

.method private static matchAddress(Ljava/util/regex/Matcher;)I
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x4

    if-gt v1, v3, :cond_0

    .line 343
    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/16 v4, 0xff

    invoke-static {v3, v0, v4}, Lorg/apache/commons/net/util/SubnetUtils;->rangeCheck(III)I

    move-result v3

    and-int/2addr v3, v4

    rsub-int/lit8 v4, v1, 0x4

    mul-int/lit8 v4, v4, 0x8

    shl-int/2addr v3, v4

    or-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v2
.end method

.method private static rangeCheck(III)I
    .locals 3

    if-lt p0, p1, :cond_0

    if-gt p0, p2, :cond_0

    return p0

    .line 359
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Value ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "] not in range ["

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ","

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static toInteger(Ljava/lang/String;)I
    .locals 3

    .line 329
    sget-object v0, Lorg/apache/commons/net/util/SubnetUtils;->addressPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 330
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 331
    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->matchAddress(Ljava/util/regex/Matcher;)I

    move-result p0

    return p0

    .line 333
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const-string p0, "Could not parse [%s]"

    invoke-static {p0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final getInfo()Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;
    .locals 2

    .line 323
    new-instance v0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;-><init>(Lorg/apache/commons/net/util/SubnetUtils;Lorg/apache/commons/net/util/SubnetUtils$1;)V

    return-object v0
.end method

.method public getNext()Lorg/apache/commons/net/util/SubnetUtils;
    .locals 3

    .line 376
    new-instance v0, Lorg/apache/commons/net/util/SubnetUtils;

    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils;->getInfo()Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getNextAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils;->getInfo()Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getNetmask()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/util/SubnetUtils;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getPrevious()Lorg/apache/commons/net/util/SubnetUtils;
    .locals 3

    .line 380
    new-instance v0, Lorg/apache/commons/net/util/SubnetUtils;

    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils;->getInfo()Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getPreviousAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils;->getInfo()Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getNetmask()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/util/SubnetUtils;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public isInclusiveHostCount()Z
    .locals 1

    .line 111
    iget-boolean v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->inclusiveHostCount:Z

    return v0
.end method

.method pop(I)I
    .locals 2

    ushr-int/lit8 v0, p1, 0x1

    const v1, 0x55555555

    and-int/2addr v0, v1

    sub-int/2addr p1, v0

    const v0, 0x33333333

    and-int v1, p1, v0

    ushr-int/lit8 p1, p1, 0x2

    and-int/2addr p1, v0

    add-int/2addr v1, p1

    ushr-int/lit8 p1, v1, 0x4

    add-int/2addr v1, p1

    const p1, 0xf0f0f0f

    and-int/2addr p1, v1

    ushr-int/lit8 v0, p1, 0x8

    add-int/2addr p1, v0

    ushr-int/lit8 v0, p1, 0x10

    add-int/2addr p1, v0

    and-int/lit8 p1, p1, 0x3f

    return p1
.end method

.method public setInclusiveHostCount(Z)V
    .locals 0

    .line 122
    iput-boolean p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->inclusiveHostCount:Z

    return-void
.end method
