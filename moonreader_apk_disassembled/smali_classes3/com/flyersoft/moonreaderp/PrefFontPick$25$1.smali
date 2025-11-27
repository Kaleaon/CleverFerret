.class Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick$25;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick$25;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 694
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 697
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$25;->val$con:Landroid/content/Context;

    const-string p2, "font_weight"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 698
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$25;->val$con:Landroid/content/Context;

    const-string p2, "font_skew"

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    const/4 p1, 0x0

    .line 699
    sput-object p1, Lcom/flyersoft/tools/A;->typefaceCache:Ljava/util/HashMap;

    .line 700
    sput-object p1, Lcom/flyersoft/tools/A;->typefaceSkewCache:Ljava/util/HashMap;

    .line 701
    sput-object p1, Lcom/flyersoft/tools/A;->fontSkewCache:Ljava/util/HashMap;

    .line 702
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$25;->val$fontIndex:I

    const/4 v0, -0x1

    const/4 v1, 0x1

    if-eq p2, v0, :cond_0

    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    if-eqz p2, :cond_0

    .line 703
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Landroid/graphics/Typeface;

    invoke-static {p2, v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fputfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;[Landroid/graphics/Typeface;)V

    .line 704
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 705
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iput-boolean v1, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->styleChanged:Z

    .line 707
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$25;->val$onDone:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

    if-eqz p2, :cond_1

    .line 708
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$25$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$25;->val$onDone:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

    invoke-interface {p2, p1, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;->getFont(Ljava/lang/String;Z)V

    :cond_1
    return-void
.end method
