.class public Lcom/flyersoft/tools/A$HighlightAll;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HighlightAll"
.end annotation


# instance fields
.field public key:Ljava/lang/String;

.field public relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

.field public relatedNoteChecked:Z

.field public style:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2707
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2708
    iput-object p1, p0, Lcom/flyersoft/tools/A$HighlightAll;->key:Ljava/lang/String;

    .line 2709
    iput-object p2, p0, Lcom/flyersoft/tools/A$HighlightAll;->style:Ljava/lang/String;

    return-void
.end method
