.class Lcom/flyersoft/moonreaderp/PrefTheme$1;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->showOverflowMenu(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

.field final synthetic val$selectedTheme:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 202
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    const/4 v1, 0x1

    if-eq p1, v1, :cond_6

    const/4 v0, 0x2

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eq p1, v0, :cond_4

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto/16 :goto_2

    .line 267
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getThemeId(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_1

    goto/16 :goto_2

    .line 270
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/A$PageTheme;

    .line 272
    invoke-static {}, Lcom/flyersoft/tools/A;->getNightTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v2

    iget-object v4, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    iput-object v4, v2, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 273
    invoke-static {}, Lcom/flyersoft/tools/A;->getNightTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v2

    iget-object v4, v0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    iput-object v4, v2, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    .line 274
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {}, Lcom/flyersoft/tools/A;->getNightTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v4

    invoke-virtual {v2, p1, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 275
    invoke-static {}, Lcom/flyersoft/tools/A;->getNightTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object p1

    iget-object v2, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/tools/A$PageTheme;->saveToXml(Ljava/lang/String;Z)V

    .line 277
    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 278
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v2, :cond_2

    const-string v2, " (AMOLED)"

    goto :goto_0

    :cond_2
    const-string v2, ""

    :goto_0
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    .line 279
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, v1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 280
    sget-boolean p1, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz p1, :cond_3

    .line 281
    sput-object v0, Lcom/flyersoft/tools/A;->amoledTheme:Lcom/flyersoft/tools/A$PageTheme;

    goto :goto_1

    .line 283
    :cond_3
    sput-object v0, Lcom/flyersoft/tools/A;->nightTheme:Lcom/flyersoft/tools/A$PageTheme;

    .line 284
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getNightTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object p1

    iput-boolean v3, p1, Lcom/flyersoft/tools/A$PageTheme;->emptyFontStyle:Z

    .line 285
    invoke-static {}, Lcom/flyersoft/tools/A;->getNightTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v3}, Lcom/flyersoft/tools/A$PageTheme;->saveToXml(Ljava/lang/String;Z)V

    .line 287
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    return-void

    .line 246
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getThemeId(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_5

    :goto_2
    return-void

    .line 249
    :cond_5
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/A$PageTheme;

    .line 251
    invoke-static {}, Lcom/flyersoft/tools/A;->getDayTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v1

    iget-object v2, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    iput-object v2, v1, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 252
    invoke-static {}, Lcom/flyersoft/tools/A;->getDayTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v1

    iget-object v2, v0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    iput-object v2, v1, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    .line 253
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getDayTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 254
    invoke-static {}, Lcom/flyersoft/tools/A;->getDayTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object p1

    iget-object v1, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {p1, v1, v3}, Lcom/flyersoft/tools/A$PageTheme;->saveToXml(Ljava/lang/String;Z)V

    .line 256
    const-string p1, "Day Theme"

    iput-object p1, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 257
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    .line 258
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v3, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 259
    sput-object v0, Lcom/flyersoft/tools/A;->dayTheme:Lcom/flyersoft/tools/A$PageTheme;

    .line 260
    invoke-static {}, Lcom/flyersoft/tools/A;->getDayTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v0

    iput-boolean v3, v0, Lcom/flyersoft/tools/A$PageTheme;->emptyFontStyle:Z

    .line 261
    invoke-static {}, Lcom/flyersoft/tools/A;->getDayTheme()Lcom/flyersoft/tools/A$PageTheme;

    move-result-object v0

    invoke-virtual {v0, p1, v3}, Lcom/flyersoft/tools/A$PageTheme;->saveToXml(Ljava/lang/String;Z)V

    .line 263
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    return-void

    .line 232
    :cond_6
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    invoke-direct {p1, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    .line 233
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->delete_theme:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 234
    invoke-virtual {p1, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefTheme$1$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$1$2;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme$1;)V

    const v2, 0x1040013

    .line 235
    invoke-virtual {p1, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const v1, 0x1040009

    .line 241
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 242
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 207
    :cond_7
    new-instance p1, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 208
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 209
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    .line 210
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->rename_file:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    .line 211
    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme$1;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 212
    invoke-virtual {v1, p1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v1, 0x1040000

    .line 227
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 228
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
