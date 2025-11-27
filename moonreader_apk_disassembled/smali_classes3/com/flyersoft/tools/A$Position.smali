.class public Lcom/flyersoft/tools/A$Position;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Position"
.end annotation


# instance fields
.field public chapter:I

.field public position:J

.field public splitIndex:I


# direct methods
.method public constructor <init>(IIJ)V
    .locals 3

    .line 4517
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-gez v2, :cond_0

    move-wide p3, v0

    .line 4520
    :cond_0
    iput p1, p0, Lcom/flyersoft/tools/A$Position;->chapter:I

    .line 4521
    iput p2, p0, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    .line 4522
    iput-wide p3, p0, Lcom/flyersoft/tools/A$Position;->position:J

    return-void
.end method
