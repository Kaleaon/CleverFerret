.class public Lcom/flyersoft/components/WidgetOptionActivity;
.super Landroid/app/Activity;
.source "WidgetOptionActivity.java"


# instance fields
.field fromDesktopConfig:Z

.field fromStartConfig:Z

.field id:I

.field items:[Ljava/lang/String;

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;

.field private mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;

.field selected:I

.field style:I

.field type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, -0x1

    .line 164
    iput v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    const/4 v0, 0x0

    .line 165
    iput v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    .line 169
    iput-boolean v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->fromStartConfig:Z

    return-void
.end method


# virtual methods
.method public getDb()Landroid/database/sqlite/SQLiteDatabase;
    .locals 2

    .line 175
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 176
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_1

    .line 179
    :try_start_0
    new-instance v0, Lcom/flyersoft/tools/BookDb$BookDBHelper;

    const-string v1, "mrbooks.db"

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/tools/BookDb$BookDBHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;

    .line 180
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 182
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0

    .line 186
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 17

    move-object/from16 v0, p0

    .line 44
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/WidgetOptionActivity;->requestWindowFeature(I)Z

    .line 47
    sget-object v2, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-nez v2, :cond_0

    .line 48
    sput-object v0, Lcom/flyersoft/tools/A;->widgetContext:Landroid/content/Context;

    .line 50
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/WidgetOptionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "appWidgetId"

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    const/4 v3, 0x0

    if-eq v2, v4, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    .line 51
    :goto_0
    iput-boolean v5, v0, Lcom/flyersoft/components/WidgetOptionActivity;->fromStartConfig:Z

    .line 52
    const-string v5, "id"

    if-ne v2, v4, :cond_2

    .line 53
    invoke-virtual {v0}, Lcom/flyersoft/components/WidgetOptionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    .line 55
    :cond_2
    invoke-virtual {v0}, Lcom/flyersoft/components/WidgetOptionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_3

    const/4 v2, 0x1

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    iput-boolean v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->fromDesktopConfig:Z

    .line 57
    iput v3, v0, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    .line 58
    const-string v2, "widget"

    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/WidgetOptionActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v7, v0, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "#0"

    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/flyersoft/components/WidgetOptionActivity;->type:Ljava/lang/String;

    .line 59
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/WidgetOptionActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v0, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "_style"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->style:I

    .line 60
    iget-object v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->type:Ljava/lang/String;

    const-string v4, "#1"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 61
    iput v1, v0, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    .line 65
    :cond_4
    invoke-virtual {v0}, Lcom/flyersoft/components/WidgetOptionActivity;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eqz v2, :cond_5

    .line 66
    invoke-virtual {v0}, Lcom/flyersoft/components/WidgetOptionActivity;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v7, "favorite"

    invoke-static {v2, v7, v3}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v2

    .line 67
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_6

    .line 68
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/2addr v5, v1

    goto :goto_2

    :cond_5
    move-object v2, v4

    .line 70
    :cond_6
    :goto_2
    sget v7, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {v0, v7}, Lcom/flyersoft/components/WidgetOptionActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    if-eqz v2, :cond_7

    .line 71
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_7

    const/4 v8, 0x1

    goto :goto_3

    :cond_7
    const/4 v8, 0x0

    .line 73
    :goto_3
    new-array v9, v5, [Ljava/lang/String;

    iput-object v9, v0, Lcom/flyersoft/components/WidgetOptionActivity;->items:[Ljava/lang/String;

    .line 74
    sget v10, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    invoke-virtual {v0, v10}, Lcom/flyersoft/components/WidgetOptionActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v3

    .line 75
    const-string v9, " "

    const-string v10, ")"

    const-string v11, " ("

    const-string v12, "("

    if-eqz v8, :cond_b

    const/4 v13, 0x1

    :goto_4
    if-ge v13, v5, :cond_a

    add-int/lit8 v14, v13, -0x1

    .line 77
    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v14, v14, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 78
    iget-object v15, v0, Lcom/flyersoft/components/WidgetOptionActivity;->type:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 79
    iput v13, v0, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    .line 80
    :cond_8
    invoke-virtual {v14, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_9

    .line 81
    iget-object v15, v0, Lcom/flyersoft/components/WidgetOptionActivity;->items:[Ljava/lang/String;

    const/16 p1, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v15, v13

    goto :goto_5

    :cond_9
    const/16 p1, 0x1

    .line 83
    iget-object v1, v0, Lcom/flyersoft/components/WidgetOptionActivity;->items:[Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v1, v13

    :goto_5
    add-int/lit8 v13, v13, 0x1

    const/4 v1, 0x1

    goto :goto_4

    :cond_a
    const/16 p1, 0x1

    goto :goto_6

    :cond_b
    const/16 p1, 0x1

    .line 86
    iget-object v1, v0, Lcom/flyersoft/components/WidgetOptionActivity;->items:[Ljava/lang/String;

    aput-object v7, v1, p1

    .line 88
    :goto_6
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v13, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_options:I

    invoke-virtual {v1, v13, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 89
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->typeGroup:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RadioGroup;

    .line 91
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->radioGroup:I

    invoke-virtual {v1, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/RadioGroup;

    const/4 v14, 0x4

    const/16 v15, 0x18

    const/4 v3, 0x6

    .line 92
    invoke-virtual {v13, v14, v15, v3, v3}, Landroid/widget/RadioGroup;->setPadding(IIII)V

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v5, :cond_10

    .line 94
    new-instance v14, Landroid/widget/RadioButton;

    invoke-direct {v14, v0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 95
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/RadioButton;->setTag(Ljava/lang/Object;)V

    if-eqz v8, :cond_e

    if-lez v3, :cond_e

    add-int/lit8 v15, v3, -0x1

    .line 98
    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v15, v15, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    move-object/from16 v16, v2

    .line 99
    iget-object v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->type:Ljava/lang/String;

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 100
    iput v3, v0, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    .line 101
    :cond_c
    invoke-virtual {v15, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 102
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    .line 104
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    :cond_e
    move-object/from16 v16, v2

    move-object v2, v7

    :goto_8
    const v15, -0x111112

    .line 107
    invoke-virtual {v14, v15}, Landroid/widget/RadioButton;->setTextColor(I)V

    const/high16 v15, 0x41900000    # 18.0f

    .line 108
    invoke-virtual {v14, v15}, Landroid/widget/RadioButton;->setTextSize(F)V

    if-nez v3, :cond_f

    .line 109
    sget v2, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/WidgetOptionActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_f
    invoke-virtual {v14, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    const/16 v2, 0x1e

    const/4 v15, 0x0

    .line 110
    invoke-virtual {v14, v15, v2, v15, v2}, Landroid/widget/RadioButton;->setPadding(IIII)V

    .line 111
    invoke-virtual {v13, v14}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v2, v16

    goto/16 :goto_7

    .line 114
    :cond_10
    iget v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    invoke-virtual {v13, v2}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 115
    iget-boolean v2, v0, Lcom/flyersoft/components/WidgetOptionActivity;->fromDesktopConfig:Z

    if-nez v2, :cond_11

    const/16 v2, 0x8

    .line 116
    invoke-virtual {v4, v2}, Landroid/widget/RadioGroup;->setVisibility(I)V

    .line 118
    :cond_11
    invoke-static {v1}, Lcom/flyersoft/tools/C;->setButtonColorState(Landroid/view/View;)V

    .line 120
    new-instance v2, Landroidx/appcompat/app/AlertDialog$Builder;

    sget v3, Lcom/flyersoft/moonreaderp/R$style;->AlertDialogStyleNight:I

    invoke-direct {v2, v0, v3}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 121
    invoke-virtual {v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/components/WidgetOptionActivity$2;

    invoke-direct {v3, v0, v13, v4, v1}, Lcom/flyersoft/components/WidgetOptionActivity$2;-><init>(Lcom/flyersoft/components/WidgetOptionActivity;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/view/View;)V

    const v1, 0x104000a

    .line 122
    invoke-virtual {v2, v1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/components/WidgetOptionActivity$1;

    invoke-direct {v2, v0}, Lcom/flyersoft/components/WidgetOptionActivity$1;-><init>(Lcom/flyersoft/components/WidgetOptionActivity;)V

    const/high16 v3, 0x1040000

    .line 153
    invoke-virtual {v1, v3, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v15, 0x0

    .line 160
    invoke-virtual {v1, v15}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    .line 161
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
