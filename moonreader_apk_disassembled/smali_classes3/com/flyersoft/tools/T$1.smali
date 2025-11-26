.class Lcom/flyersoft/tools/T$1;
.super Ljava/lang/Object;
.source "T.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$duration:I

.field final synthetic val$text:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Ljava/lang/CharSequence;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1443
    iput-object p1, p0, Lcom/flyersoft/tools/T$1;->val$text:Ljava/lang/CharSequence;

    iput p2, p0, Lcom/flyersoft/tools/T$1;->val$duration:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1446
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/tools/T$1;->val$text:Ljava/lang/CharSequence;

    iget v2, p0, Lcom/flyersoft/tools/T$1;->val$duration:I

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-void
.end method
