.class Lcom/flyersoft/moonreaderp/PrefMisc$71;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createTtsFiltersView(Landroid/content/Context;)Landroid/view/View;
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

    .line 1823
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$71;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1826
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$71;->val$context:Landroid/content/Context;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smregularExpressionTip(Landroid/content/Context;)V

    return-void
.end method
