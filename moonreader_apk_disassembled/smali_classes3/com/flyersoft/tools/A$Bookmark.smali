.class public Lcom/flyersoft/tools/A$Bookmark;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bookmark"
.end annotation


# instance fields
.field public chapter:I

.field public checkRealPosition:Z

.field public color:I

.field public drawY:I

.field public drawY2:I

.field public filename:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public position:J

.field public splitIndex:I

.field public time:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIJJI)V
    .locals 0

    .line 4537
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4538
    iput-object p1, p0, Lcom/flyersoft/tools/A$Bookmark;->filename:Ljava/lang/String;

    .line 4539
    iput-object p2, p0, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    .line 4540
    iput p3, p0, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    .line 4541
    iput p4, p0, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    .line 4542
    iput-wide p5, p0, Lcom/flyersoft/tools/A$Bookmark;->position:J

    .line 4543
    iput-wide p7, p0, Lcom/flyersoft/tools/A$Bookmark;->time:J

    .line 4544
    iput p9, p0, Lcom/flyersoft/tools/A$Bookmark;->color:I

    return-void
.end method
