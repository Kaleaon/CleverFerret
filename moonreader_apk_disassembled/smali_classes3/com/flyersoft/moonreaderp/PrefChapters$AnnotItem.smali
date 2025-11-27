.class public Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;
.super Ljava/lang/Object;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AnnotItem"
.end annotation


# instance fields
.field public bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

.field public chapter:I

.field public checked:Z

.field public filename:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public note:Lcom/flyersoft/tools/BookDb$NoteInfo;

.field public number:I

.field public position:J

.field public resId:I

.field public splitIndex:I

.field public time:J


# direct methods
.method public constructor <init>(Ljava/lang/String;IIJLjava/lang/String;ILcom/flyersoft/tools/A$Bookmark;Lcom/flyersoft/tools/BookDb$NoteInfo;JI)V
    .locals 0

    .line 1316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1317
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->filename:Ljava/lang/String;

    .line 1318
    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    .line 1319
    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    .line 1320
    iput-wide p4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    .line 1321
    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    .line 1322
    iput p7, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    .line 1323
    iput-object p8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    .line 1324
    iput-object p9, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    const/4 p1, 0x1

    .line 1325
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->checked:Z

    .line 1326
    iput-wide p10, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->time:J

    .line 1327
    iput p12, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->number:I

    return-void
.end method
