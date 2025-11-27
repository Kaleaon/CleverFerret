.class Lcom/flyersoft/moonreaderp/PrefMisc$78;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createNamesReplacementView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
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

    .line 1936
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$78;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1939
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$78;->val$context:Landroid/content/Context;

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview;->show(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    return-void
.end method
