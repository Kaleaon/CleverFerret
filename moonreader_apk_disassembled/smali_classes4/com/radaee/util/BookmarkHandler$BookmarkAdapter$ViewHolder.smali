.class Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "BookmarkHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field label:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;


# direct methods
.method private constructor <init>(Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 280
    iput-object p1, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;->this$0:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Lcom/radaee/util/BookmarkHandler$1;)V
    .locals 0

    .line 280
    invoke-direct {p0, p1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;-><init>(Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;)V

    return-void
.end method
