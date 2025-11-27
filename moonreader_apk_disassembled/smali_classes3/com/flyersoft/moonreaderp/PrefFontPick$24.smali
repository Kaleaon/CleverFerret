.class Lcom/flyersoft/moonreaderp/PrefFontPick$24;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->doFontWeight(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Typeface;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$font:Ljava/lang/String;

.field final synthetic val$fontIndex:I

.field final synthetic val$onDone:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;


# direct methods
.method constructor <init>(Ljava/lang/String;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 665
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$font:Ljava/lang/String;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$fontIndex:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$onDone:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 669
    sget p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$font:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->getFontWeight(Ljava/lang/String;)I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, p2, :cond_0

    .line 671
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$font:Ljava/lang/String;

    sget p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->saveFontWeight(Ljava/lang/String;I)V

    .line 672
    sput-object v0, Lcom/flyersoft/tools/A;->typefaceCache:Ljava/util/HashMap;

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 674
    :goto_0
    sget p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$font:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getFontSkew(Ljava/lang/String;)F

    move-result v2

    cmpl-float p2, p2, v2

    if-eqz p2, :cond_1

    .line 676
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$font:Ljava/lang/String;

    sget p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->saveFontSkew(Ljava/lang/String;F)V

    const/4 p1, 0x1

    :cond_1
    if-eqz p1, :cond_3

    .line 678
    iget p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$fontIndex:I

    const/4 v2, -0x1

    if-eq p2, v2, :cond_3

    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    if-eqz p2, :cond_3

    .line 679
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object p2

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$fontIndex:I

    aput-object v0, p2, v2

    .line 680
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 681
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$font:Ljava/lang/String;

    invoke-static {p2, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$misCurrentFont(Lcom/flyersoft/moonreaderp/PrefFontPick;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontVisible:Z

    if-eqz p2, :cond_3

    .line 682
    :cond_2
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iput-boolean v1, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->styleChanged:Z

    :cond_3
    if-eqz p1, :cond_4

    .line 684
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$24;->val$onDone:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

    if-eqz p1, :cond_4

    .line 685
    invoke-interface {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;->getFont(Ljava/lang/String;Z)V

    :cond_4
    return-void
.end method
