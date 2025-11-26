.class public Lcom/flyersoft/books/chmlib/HHC$HChapter;
.super Ljava/lang/Object;
.source "HHC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/HHC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HChapter"
.end annotation


# instance fields
.field public filename:Ljava/lang/String;

.field public hasSubChapter:Z

.field public indent:I

.field public name:Ljava/lang/String;

.field public size:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    const-string v0, ""

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHC$HChapter;->name:Ljava/lang/String;

    .line 167
    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHC$HChapter;->filename:Ljava/lang/String;

    const-wide/16 v0, 0x0

    .line 168
    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HHC$HChapter;->size:J

    const/4 v0, 0x0

    .line 169
    iput-boolean v0, p0, Lcom/flyersoft/books/chmlib/HHC$HChapter;->hasSubChapter:Z

    .line 170
    iput v0, p0, Lcom/flyersoft/books/chmlib/HHC$HChapter;->indent:I

    return-void
.end method
