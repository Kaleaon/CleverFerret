.class public final Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;
.super Ljava/lang/Object;
.source "SubnetUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/util/SubnetUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SubnetInfo"
.end annotation


# static fields
.field private static final UNSIGNED_INT_MASK:J = 0xffffffffL


# instance fields
.field final synthetic this$0:Lorg/apache/commons/net/util/SubnetUtils;


# direct methods
.method private constructor <init>(Lorg/apache/commons/net/util/SubnetUtils;)V
    .locals 0

    .line 135
    iput-object p1, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/net/util/SubnetUtils;Lorg/apache/commons/net/util/SubnetUtils$1;)V
    .locals 0

    .line 131
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;-><init>(Lorg/apache/commons/net/util/SubnetUtils;)V

    return-void
.end method

.method private broadcastLong()J
    .locals 4

    .line 139
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$100(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private format([I)Ljava/lang/String;
    .locals 3

    .line 291
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 292
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 293
    aget v2, p1, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 294
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_0

    .line 295
    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 298
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private high()I
    .locals 5

    .line 147
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-virtual {v0}, Lorg/apache/commons/net/util/SubnetUtils;->isInclusiveHostCount()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$100(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    return v0

    .line 148
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->broadcastLong()J

    move-result-wide v0

    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->networkLong()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$100(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private low()I
    .locals 5

    .line 142
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-virtual {v0}, Lorg/apache/commons/net/util/SubnetUtils;->isInclusiveHostCount()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$000(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    return v0

    .line 143
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->broadcastLong()J

    move-result-wide v0

    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->networkLong()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$000(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private networkLong()J
    .locals 4

    .line 138
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$000(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private toArray(I)[I
    .locals 4

    const/4 v0, 0x4

    .line 280
    new-array v0, v0, [I

    const/4 v1, 0x3

    :goto_0
    if-ltz v1, :cond_0

    .line 282
    aget v2, v0, v1

    rsub-int/lit8 v3, v1, 0x3

    mul-int/lit8 v3, v3, 0x8

    ushr-int v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    aput v2, v0, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public asInteger(Ljava/lang/String;)I
    .locals 0

    .line 257
    invoke-static {p1}, Lorg/apache/commons/net/util/SubnetUtils;->access$200(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getAddress()Ljava/lang/String;
    .locals 1

    .line 195
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$400(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAddressCount()I
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 235
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getAddressCountLong()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    long-to-int v1, v0

    return v1

    .line 237
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Count is larger than an integer: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getAddressCountLong()J
    .locals 5

    .line 250
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->broadcastLong()J

    move-result-wide v0

    .line 251
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->networkLong()J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 252
    iget-object v2, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-virtual {v2}, Lorg/apache/commons/net/util/SubnetUtils;->isInclusiveHostCount()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    :goto_0
    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    return-wide v2

    :cond_1
    return-wide v0
.end method

.method public getAllAddresses()[Ljava/lang/String;
    .locals 4

    .line 265
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getAddressCount()I

    move-result v0

    .line 266
    new-array v1, v0, [Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_1

    .line 270
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->low()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->high()I

    move-result v3

    if-gt v0, v3, :cond_1

    .line 271
    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-object v1
.end method

.method public getBroadcastAddress()Ljava/lang/String;
    .locals 1

    .line 183
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$100(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCidrSignature()Ljava/lang/String;
    .locals 3

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v1}, Lorg/apache/commons/net/util/SubnetUtils;->access$400(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v1}, Lorg/apache/commons/net/util/SubnetUtils;->access$300(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/util/SubnetUtils;->pop(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHighAddress()Ljava/lang/String;
    .locals 1

    .line 223
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->high()I

    move-result v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLowAddress()Ljava/lang/String;
    .locals 1

    .line 213
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->low()I

    move-result v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNetmask()Ljava/lang/String;
    .locals 1

    .line 191
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$300(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNetworkAddress()Ljava/lang/String;
    .locals 1

    .line 187
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$000(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextAddress()Ljava/lang/String;
    .locals 1

    .line 199
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$400(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPreviousAddress()Ljava/lang/String;
    .locals 1

    .line 203
    iget-object v0, p0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->this$0:Lorg/apache/commons/net/util/SubnetUtils;

    invoke-static {v0}, Lorg/apache/commons/net/util/SubnetUtils;->access$400(Lorg/apache/commons/net/util/SubnetUtils;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->toArray(I)[I

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isInRange(I)Z
    .locals 9

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    int-to-long v1, p1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    .line 177
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->low()I

    move-result p1

    int-to-long v5, p1

    and-long/2addr v5, v3

    .line 178
    invoke-direct {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->high()I

    move-result p1

    int-to-long v7, p1

    and-long/2addr v3, v7

    cmp-long p1, v1, v5

    if-ltz p1, :cond_1

    cmp-long p1, v1, v3

    if-gtz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method

.method public isInRange(Ljava/lang/String;)Z
    .locals 0

    .line 160
    invoke-static {p1}, Lorg/apache/commons/net/util/SubnetUtils;->access$200(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->isInRange(I)Z

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CIDR Signature:\t["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 308
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getCidrSignature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "] Netmask: ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getNetmask()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]\nNetwork:\t["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getNetworkAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]\nBroadcast:\t["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getBroadcastAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]\nFirst Address:\t["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getLowAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]\nLast Address:\t["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getHighAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]\n# Addresses:\t["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    invoke-virtual {p0}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;->getAddressCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
