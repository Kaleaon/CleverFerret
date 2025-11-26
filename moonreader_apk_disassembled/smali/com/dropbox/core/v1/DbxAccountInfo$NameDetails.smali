.class public final Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;
.super Lcom/dropbox/core/util/Dumpable;
.source "DbxAccountInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxAccountInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NameDetails"
.end annotation


# static fields
.field private static final FM:Lcom/dropbox/core/json/JsonReader$FieldMapping;

.field private static final FM_familiar_name:I = 0x0

.field private static final FM_given_name:I = 0x1

.field private static final FM_surname:I = 0x2

.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final familiarName:Ljava/lang/String;

.field public final givenName:Ljava/lang/String;

.field public final surname:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 156
    new-instance v0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails$1;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->Reader:Lcom/dropbox/core/json/JsonReader;

    .line 203
    new-instance v0, Lcom/dropbox/core/json/JsonReader$FieldMapping$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/json/JsonReader$FieldMapping$Builder;-><init>()V

    .line 204
    const-string v1, "familiar_name"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/dropbox/core/json/JsonReader$FieldMapping$Builder;->add(Ljava/lang/String;I)V

    .line 205
    const-string v1, "given_name"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/dropbox/core/json/JsonReader$FieldMapping$Builder;->add(Ljava/lang/String;I)V

    .line 206
    const-string v1, "surname"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/dropbox/core/json/JsonReader$FieldMapping$Builder;->add(Ljava/lang/String;I)V

    .line 207
    invoke-virtual {v0}, Lcom/dropbox/core/json/JsonReader$FieldMapping$Builder;->build()Lcom/dropbox/core/json/JsonReader$FieldMapping;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->FM:Lcom/dropbox/core/json/JsonReader$FieldMapping;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 139
    invoke-direct {p0}, Lcom/dropbox/core/util/Dumpable;-><init>()V

    .line 140
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->familiarName:Ljava/lang/String;

    .line 141
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->givenName:Ljava/lang/String;

    .line 142
    iput-object p3, p0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->surname:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100()Lcom/dropbox/core/json/JsonReader$FieldMapping;
    .locals 1

    .line 132
    sget-object v0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->FM:Lcom/dropbox/core/json/JsonReader$FieldMapping;

    return-object v0
.end method


# virtual methods
.method protected dumpFields(Lcom/dropbox/core/util/DumpWriter;)V
    .locals 2

    .line 148
    const-string v0, "familiarName"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->familiarName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    .line 149
    const-string v0, "givenName"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->givenName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    .line 150
    const-string v0, "surname"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object p1

    iget-object v0, p0, Lcom/dropbox/core/v1/DbxAccountInfo$NameDetails;->surname:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    return-void
.end method
