.class public Lcom/flyersoft/components/cloud/Cloud$Progress;
.super Ljava/lang/Object;
.source "Cloud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/cloud/Cloud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Progress"
.end annotation


# instance fields
.field progress:J

.field total:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput-wide p1, p0, Lcom/flyersoft/components/cloud/Cloud$Progress;->progress:J

    .line 218
    iput-wide p3, p0, Lcom/flyersoft/components/cloud/Cloud$Progress;->total:J

    return-void
.end method
