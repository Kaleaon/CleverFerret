.class public Lcom/radaee/util/BookmarkHandler$Bookmark;
.super Ljava/lang/Object;
.source "BookmarkHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/BookmarkHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bookmark"
.end annotation


# instance fields
.field public bmLabel:Ljava/lang/String;

.field public page:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lcom/radaee/util/BookmarkHandler$Bookmark;->page:I

    .line 49
    iput-object p2, p0, Lcom/radaee/util/BookmarkHandler$Bookmark;->bmLabel:Ljava/lang/String;

    return-void
.end method
