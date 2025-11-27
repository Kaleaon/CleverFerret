.class Lcom/flyersoft/moonreaderp/ActivityTxt$104;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showTTSMoreOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 11316
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$104;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 11319
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$104;->val$context:Landroid/content/Context;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setTTSFilter(Landroid/content/Context;)V

    return-void
.end method
