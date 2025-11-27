.class public Lcom/flyersoft/tools/BookDb$NoteInfo;
.super Ljava/lang/Object;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/BookDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NoteInfo"
.end annotation


# instance fields
.field public bak:Ljava/lang/String;

.field public book:Ljava/lang/String;

.field public bookmark:Ljava/lang/String;

.field public checkRealPosition:Z

.field public filename:Ljava/lang/String;

.field public highlightColor:I

.field public highlightLength:I

.field public id:I

.field public isHighlightAllItem:Z

.field public lastChapter:I

.field public lastPosition:J

.field public lastSplitIndex:I

.field public noteText:Ljava/lang/String;

.field public original:Ljava/lang/String;

.field public relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

.field public squiggly:Z

.field public strikethrough:Z

.field public time:J

.field public underline:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 1

    move-object/from16 v0, p17

    .line 1096
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1097
    iput p1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->id:I

    .line 1098
    iput-object p2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->book:Ljava/lang/String;

    .line 1099
    iput-object p3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    .line 1100
    iput p4, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    .line 1101
    iput p5, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    .line 1102
    iput-wide p6, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    .line 1103
    iput p8, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    .line 1104
    iput p9, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    .line 1105
    iput-wide p10, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    .line 1106
    iput-object p12, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    .line 1107
    iput-object p13, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1108
    iput-object p14, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    move/from16 p1, p15

    .line 1109
    iput-boolean p1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    move/from16 p1, p16

    .line 1110
    iput-boolean p1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    .line 1111
    const-string p1, "1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    .line 1112
    iput-object v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bak:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public copy()Lcom/flyersoft/tools/BookDb$NoteInfo;
    .locals 20

    move-object/from16 v0, p0

    .line 1117
    new-instance v1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v2, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->id:I

    iget-object v3, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->book:Ljava/lang/String;

    iget-object v4, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    iget v5, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v6, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget-wide v7, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget v9, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    iget v10, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    iget-wide v11, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    iget-object v13, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    iget-object v14, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v15, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-boolean v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    move/from16 v17, v1

    iget-boolean v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    move/from16 v18, v1

    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bak:Ljava/lang/String;

    move/from16 v19, v18

    move-object/from16 v18, v1

    move-object/from16 v1, v16

    move/from16 v16, v17

    move/from16 v17, v19

    invoke-direct/range {v1 .. v18}, Lcom/flyersoft/tools/BookDb$NoteInfo;-><init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    move-object/from16 v16, v1

    return-object v16
.end method
