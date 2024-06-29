﻿<%@ Page Title="Quản Lý Sản Phẩm" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Quanly.aspx.cs" Inherits="Nhom3_BanGame.Quanly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="mycol-4">
        <asp:Label ID="lblMessage" runat="server" Text="" />
    </div>
    <div class="mycol-4" style="text-align: right;">
        <asp:Label ID="Label5" runat="server" Text="[" Font-Size="12px" Visible="true"></asp:Label>
        <asp:LinkButton ID="lbNewSanpham" runat="server" Font-Size="12px" OnClick="lbNewSanpham_Click">Thêm</asp:LinkButton>
        <asp:Label ID="Label6" runat="server" Text="]" Font-Size="12px" Visible="true"></asp:Label>
    </div>
    <%----Gridview----%>
    <div class="myrow" style="margin-top: 20px;">
        <div class="mycol-2">
            <asp:ListBox ID="ListTheLoai" runat="server" DataSourceID="SqlDataSource1" Width="100%" Height="150px"
            DataTextField="TheLoai" DataValueField="IdTL" AutoPostBack="true" OnSelectedIndexChanged="ShowNhom"></asp:ListBox>  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"   
            ConnectionString="<%$ ConnectionStrings:LocalConnection %>"   
            SelectCommand="SELECT * FROM THELOAIGAME"></asp:SqlDataSource>                
        </div>
        <div class="mycol-1"></div>
        <div class="mycol-9">
            <asp:GridView ID="gvGames" runat="server" AutoGenerateColumns="False" AllowSorting="True"  width="90%"
                DataKeyNames="IdGame"
                BorderColor="Silver"
                OnRowDeleting="gvGames_RowDeleting"
                OnRowCommand="gvGames_RowCommand"
                EmptyDataText="Không có dữ liệu">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Width="25px" />
                        <ItemStyle HorizontalAlign="Left" Font-Bold="true" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="image">
                        <ItemTemplate>
                            <asp:Image ID="img" runat="server" Width="100px" Height="100px" imageurl='<%#  "~/Images/"+Eval("HinhAnh") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="TheLoai" HeaderText="Thể Loại">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenGame" HeaderText="Tên Game">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NhaPhatHanh" HeaderText="Nhà Phát Hành">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Giaban" HeaderText="Giá bán" DataFormatString="{0:### ### ###}" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <%-- Delete Sanpham --%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelSanpham" Text="Del" runat="server"
                                OnClientClick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này?');" CommandName="Delete" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>

                    <%-- Update Company --%>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbUpdSanpham" runat="server" CommandArgument='<%# Eval("IdGame") %>'
                                CommandName="UpdSanpham" Text="Upd" CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>        
    </div>    
</asp:Content>
