.class Lcom/flyersoft/moonreaderp/PrefThumbnails$1;
.super Ljava/lang/Object;
.source "PrefThumbnails.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefThumbnails;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefThumbnails;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 100
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$1;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 103
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$1;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->dismiss()V

    return-void
.end method
