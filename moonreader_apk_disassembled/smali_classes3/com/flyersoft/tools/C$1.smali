.class Lcom/flyersoft/tools/C$1;
.super Ljava/lang/Object;
.source "C.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/C;->setStatusBarColor(Landroid/view/Window;ILcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$color:I

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;

.field final synthetic val$window:Landroid/view/Window;


# direct methods
.method constructor <init>(ILandroid/view/Window;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 144
    iput p1, p0, Lcom/flyersoft/tools/C$1;->val$color:I

    iput-object p2, p0, Lcom/flyersoft/tools/C$1;->val$window:Landroid/view/Window;

    iput-object p3, p0, Lcom/flyersoft/tools/C$1;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    .line 148
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->statusBarInsets:Landroid/graphics/Insets;

    .line 149
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1()I

    move-result v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->navigationBarInsets:Landroid/graphics/Insets;

    .line 150
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2()I

    move-result v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->cutoutInsets:Landroid/graphics/Insets;

    .line 151
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$3()I

    move-result v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    .line 153
    sget-object v1, Lcom/flyersoft/tools/A;->statusBarInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/graphics/Insets;)I

    move-result v1

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/graphics/Insets;)I

    move-result v0

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 161
    iget v0, p0, Lcom/flyersoft/tools/C$1;->val$color:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 163
    iget-object p1, p0, Lcom/flyersoft/tools/C$1;->val$window:Landroid/view/Window;

    invoke-static {p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 166
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    const/16 v1, 0x10

    if-nez v0, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 v2, 0x10

    :cond_1
    :goto_0
    invoke-static {p1, v2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsetsController;II)V

    .line 169
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/tools/C$1;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-eqz p1, :cond_3

    const/4 v0, 0x0

    .line 170
    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    :cond_3
    return-object p2
.end method
