.class Lcom/flyersoft/moonreaderp/PrefChapters$18;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->addNewFavorites(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1133
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$18;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEdit(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1135
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$18;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mcreateBookmarkAndExit(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;)V

    return-void
.end method
